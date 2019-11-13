import 'dart:io';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_phoenix/home/bean/home_bean_entity.dart';
import 'package:flutter_phoenix/home/bean/poetry_bean_entity.dart';

class HttpApiError {
  final String status;
  final String errMessage;

  HttpApiError({this.status, this.errMessage});
}

class HttpUtils {
  //
  static HttpUtils _instance;
  String _token;

  //单例
  static HttpUtils getInstance() {
    if (_instance == null) {
      _instance = HttpUtils();
    }
    return _instance;
  }

  Dio _dio = new Dio();

  HttpUtils() {
    _dio.options.baseUrl = "https://v2.jinrishici.com/";
    _dio.options.connectTimeout = 5000;
    _dio.options.receiveTimeout = 3000;

    _dio.interceptors.add(CookieManager(CookieJar()));
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: _onRequest,
      onResponse: _onResponse,
      onError: _onError,
    ));
  }

  String get token => _token;

  set token(String value) {
    _token = value;
  }

  _onRequest(RequestOptions options) {
    if (null != _token) {
      options.headers['X-User-Token'] = _token;
    }
    debugPrint('----HttpApi Open--------------------------------------------');
    debugPrint('Url:      ${options.uri}');
    debugPrint('Method:   ${options.method}');
    debugPrint('Headers:  ${options.headers}');
    debugPrint('Request:  ${options.data}');
  }

  _onResponse(Response e) {
    debugPrint('Response: ${e.data}');
    debugPrint('----HttpApi End--------------------------------------------');
  }

  _onError(DioError e) {
    debugPrint(e.toString());
  }

  Future<T> _getData<T>(
      Future<Response<Map>> res, T Function(dynamic json) formJson) async {
    Response<Map> map = await res;
    String status = map.data['status'];
    String errMessage = map.data['errMessage'];

    if (status == "success") {
      if (null == formJson) {
        return Future.value(null);
      }
      var data = map.data['data'];
      if (null != formJson && null != data) {
        return Future.value(formJson(data));
      }
      return Future.value(null);
    }

    return Future.error(HttpApiError(status: status, errMessage: errMessage));
  }

  /// 每日诗词 Token
  Future<String> getToken() {
    var res = _dio.get<Map>("token");
    return _getData<String>(res, (data) => data);
  }

  /// 每日诗词 PoetryBeanEntity
  Future<PoetryBeanData > getSentence() {
    var res = _dio.get<Map>("sentence");
    return _getData<  PoetryBeanData>(res, (data) =>PoetryBeanData.fromJson(data));
  }


}
