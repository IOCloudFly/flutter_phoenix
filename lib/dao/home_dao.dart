import 'dart:convert';
import 'dart:async';
import 'package:flutter_phoenix/home/bean/home_bean_entity.dart';
import 'package:http/http.dart' as http; //防止重名

const HOME_URL = "https://cn.bing.com";

///
/// n: 1-8 返回请求数量，目前最多一次获取8张
///
///         0 今天
/// idx:   -1 截止中明天 （预准备的）
///         1 截止至昨天，类推（目前最多获取到7天前的图片）
///
const IMAGE_NUMBER = "/HPImageArchive.aspx?format=js&idx=0&n=8&mkt=zh-CN";

const BASE_URL = HOME_URL + IMAGE_NUMBER;


///首页图片
class HomeDao {
  static Future<HomeBeanEntity> fetch() async{
    final response = await http.get(BASE_URL);
    if(response.statusCode == 200){
      Utf8Decoder utf8decoder = new Utf8Decoder(); //
      var result = json.decode(utf8decoder.convert(response.bodyBytes));
      //print(result.toString());
      return HomeBeanEntity.fromJson(result);
    }else{
      throw Exception('Error=============!!!!!!');
    }
  }
}