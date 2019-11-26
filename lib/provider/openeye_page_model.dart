
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_phoenix/home/bean/eye_open_bean.dart';
import 'package:flutter_phoenix/net/constant.dart';
import 'package:flutter_phoenix/net/respository_eye.dart';

class OpenEyePageModel extends ChangeNotifier{

  List<ItemList>  itemList = [];
  List<ItemList>  bannerList = [];
  bool isInit;

  void initPage(bool isInit){
    this.isInit = isInit;
    notifyListeners();
  }

  Future<List<ItemList>> loadBanner() async {
    try {
      var response = await EyeRespository.getOpenEyePageList(
          ConstantUrl.openeyePageUrl);
      debugPrint('--------$response');
      Map map = json.decode(response.toString());
      var issueEntity = EyeOpenBean.fromJson(map);

      var list = issueEntity.issueList[0].itemList;
      debugPrint('--------$list');
      list.removeWhere((item) {
        return item.type == 'banner2';
      });
      bannerList = list;
      return bannerList;
    }catch(e){
      return null;
    }
  }








}