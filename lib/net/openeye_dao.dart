import 'package:dio/dio.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';

import 'package:flutter_phoenix/home/bean/eye_bean_entity.dart';
import 'package:flutter_phoenix/home/bean/eye_open_bean.dart';

class OpenEyeDaoError{
  final int code;
  final String errMessage;

  OpenEyeDaoError({this.code, this.errMessage});
}

///开眼网络请求
class OpenEyeDao{
  static OpenEyeDao _openEyeDao;

  static OpenEyeDao getInstance(){
    if(_openEyeDao == null){
      _openEyeDao = OpenEyeDao();
    }
    return _openEyeDao;
  }

  Dio _dio = new Dio();
  
  OpenEyeDao(){
    _dio.options.baseUrl = "http://baobab.kaiyanapp.com/";
    _dio.options.connectTimeout = 5000;
    _dio.options.receiveTimeout = 3000;
    _dio.options.headers = {
      'user-agent':'Mozilla/5.0 (Windows; U; Windows NT 6.1; en-us) AppleWebKit/534.50 (KHTML, like Gecko) Version/5.1 Safari/534.50',
    };
    
    _dio.interceptors.add(CookieManager(CookieJar()));
    _dio.interceptors.add(InterceptorsWrapper(
        onRequest: _onRequest,
        onResponse: _onResponse,
        onError: _onError,
    ));
    
  }

  _onRequest(RequestOptions options){
    debugPrint('-------------OpenEye Start---------------');
    debugPrint('Url:         ${options.uri}');
    debugPrint('Method:      ${options.method}');
    debugPrint('Headers:     ${options.headers}');
    debugPrint('Request:     ${options.data}');

  }

  _onResponse(Response e){
    debugPrint('Response: ${e.data}');
    debugPrint('--------------OpenEye End----------------');
  }

  _onError(DioError e){
    debugPrint(e.toString());
  }

  Future<T> _getData<T>(
      Future<Response<Map>> res,T Function(dynamic json) fromJson) async{
      Response<Map> map = await res;
//      int code = map.data['code'];
//      String errMessage = map.data['errMessage'];

      if(200 == map.statusCode){
        if(null == fromJson){
          return Future.value(null);
        }
        var data = map.data['issueList'];
        if(null != fromJson && null != data){
          return Future.value(fromJson(data));
        }
        return Future.value(null);
      }
      return Future.error(OpenEyeDaoError(code : map.statusCode,errMessage: map.statusMessage));
  }

//  Future<List<ItemList>> getEyeBean(){
//    var res = _dio.get<Map>('api/v2/feed?num=1');
//    return _getData<List<ItemList>>(res, (data)=>ItemList.fromJson(data));
//  }
    //如果没有状态码之类的，就直接请求返回数据
    Future<EyeOpenBean> getEyeBean() async{
      var res = await _dio.get<Map>('api/v2/feed?num=1');
      return EyeOpenBean.fromJson(res.data);
    }



}

