import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';


const httpHeaders = {
  'user-agent':'Mozilla/5.0 (Windows; U; Windows NT 6.1; en-us) AppleWebKit/534.50 (KHTML, like Gecko) Version/5.1 Safari/534.50',
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