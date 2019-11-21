import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';


const httpHeaders = {
  'Accept': 'application/json, text/plain, */*',
  'Accept-Encoding': 'gzip, deflate, br',
  'Accept-Language': 'zh-CN,zh;q=0.9',
  'Connection': 'keep-alive',
  'Content-Type': 'application/json',
  'User-Agent':
  'Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A372 Safari/604.1',
};

class HttpOpenEye{

  static Dio _dio;

  static Options _options = Options(
      sendTimeout: 5000,
      receiveTimeout: 5000,
      headers: httpHeaders
  );

  static Dio buildDio(){
    _dio ??= Dio();
    return _dio;
  }

  static doGet(
    String url,{
    queryParameters,
    option,
    Function success,
    Function fail,
  }) async{
    print('http request url :$url');
    try {
      Response response = await buildDio().get(
        url,
        queryParameters: queryParameters,
        options: _options,
      );
      success(response);
      print('http response :$response');
    }catch(exception){
      fail(exception);
      print('http request fail: $url -----$exception');
    }
  }

}