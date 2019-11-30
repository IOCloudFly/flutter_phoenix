import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_phoenix/home/bean/eye_bean_entity.dart';
import 'package:flutter_phoenix/home/bean/eye_open_bean.dart';
import 'package:flutter_phoenix/net/constant.dart';
import 'package:flutter_phoenix/net/respository_eye.dart';

class OpenEyePageModel extends ChangeNotifier {
  EasyRefreshController controller = EasyRefreshController(); //上拉刷新，下拉加载
  ScrollController scrollController = ScrollController();

  String nextPageUrl;
  bool isRefresh = true;

  List<Item> itemList = [];
  List<Item> bannerList = [];
  bool isInit;

  ///初始化
  init() async {
    initPage(true);
    await loadData(url: ConstantUrl.openeyePageUrl);
  }

  void initPage(bool isInit) {
    this.isInit = isInit;
    notifyListeners();
  }

  Future<List<Item>> loadBanner() async {
    try {
      var response =
          await EyeRespository.getOpenEyePageList(ConstantUrl.openeyePageUrl);
      debugPrint('--------$response');
      Map map = json.decode(response.toString());
      var issueEntity = IssueEntity.fromJson(map);
      nextPageUrl = issueEntity.nextPageUrl;
      await loadData(url: nextPageUrl);
      var list = issueEntity.issueList[0].itemList;
      debugPrint('--------$list');
      list.removeWhere((item) {
        return item.type == 'banner2';
      });
      bannerList = list;
      return bannerList;
    } catch (e) {
      return null;
    }
  }

  ///加载数据
  Future<List<Item>> loadData({String url}) async {
    try {
      var response =
          await EyeRespository.getOpenEyePageList(url);
      print(response.toString());
      Map map = json.decode(response.toString());
      var issueEntity = IssueEntity.fromJson(map);
      nextPageUrl = issueEntity.nextPageUrl;
      var list = issueEntity.issueList[0].itemList;
      list.removeWhere((item) {
        return item.type == 'banner2';
      });
      if (isInit) {
        initPage(false);
      }
      if (isRefresh) {
        itemList.clear();
        itemList.addAll(list);
        controller.resetLoadState();
        controller.finishRefresh();
      } else {
        itemList.addAll(list);
        controller.finishLoad();
      }
      notifyListeners();
      return itemList;
    } catch (e, s) {
      if (isRefresh) {
        controller.resetLoadState();
        controller.finishRefresh(
          success: false,
        );
      }else{
        controller.finishLoad();
      }
      return null;
    }
  }

  ///上拉刷新
  Future<List<Item>> onRefresh() async{
    isRefresh = true;
    return await loadData(url: ConstantUrl.openeyePageUrl);
  }

  ///下拉加载
  Future<List<Item>> onLoadMore() async{
    isRefresh = false;
    return await loadData(url: nextPageUrl);
  }

}
