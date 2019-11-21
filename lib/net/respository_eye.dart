import 'package:dio/dio.dart';
import 'package:flutter_phoenix/net/http_open.dart';

class EyeRespository{

  ///请求get
  static Future getOpenEyePageList(url) async {
    var response = await HttpOpenEye.buildDio().get(
      url,
      options:Options(
        sendTimeout:  5000,
        receiveTimeout: 5000,
        headers: httpHeaders
      )
    );
    return response;
  }

}