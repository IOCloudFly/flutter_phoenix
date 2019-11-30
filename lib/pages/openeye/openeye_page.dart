import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_phoenix/pages/openeye/eye_page_item.dart';
import 'package:flutter_phoenix/pages/openeye/time_title_item.dart';
import 'package:flutter_phoenix/provider/openeye_page_model.dart';
import 'package:flutter_phoenix/provider/provider_widget.dart';
import 'package:flutter_phoenix/utils/loading_widget.dart';
import 'package:flutter_phoenix/utils/refresh/load_more_footer.dart';
import 'package:flutter_phoenix/utils/refresh/refresh_header.dart';
import 'package:provider/provider.dart';

import 'eye_page_item.dart';
import 'time_title_item.dart';
///开眼page
///
/// 使用Provider 状态管理对视频界面做独特处理，方便日后维护与管理
///
///
///
///
class OpenEyePage extends StatefulWidget {
  @override
  _OpenEyePageState createState() => _OpenEyePageState();
}

class _OpenEyePageState extends State<OpenEyePage>
    with AutomaticKeepAliveClientMixin {

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ProviderWidget<OpenEyePageModel>(
        model: OpenEyePageModel(),
        onModelInitial: (model) {
          model.init();
        },
        builder: (context, model, child) {
          return Scaffold(
              appBar: AppBar(
                title: Text('每日精选', style: TextStyle(
                    color: Colors.black
                )),
                centerTitle: true,
                backgroundColor: Colors.white,
                elevation: 0,
                actions: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.search,
                      color: Colors.black,
                    ),

                    ///搜索按钮的点击事件
                    onPressed: () {

                    },
                  )
                ],
              ),
              body: Container(
                color: Color(0xFFF4F4F4),
                child: EasyRefresh.custom(
                    enableControlFinishRefresh: true,
                    enableControlFinishLoad: true,
                    taskIndependence: true,
                    header: MyClassicalHeader(enableInfiniteRefresh: false),
                    footer: MyClassicalFooter(enableInfiniteLoad: false),
                    controller: model.controller,
                    scrollController: model.scrollController,
                    onRefresh: model.onRefresh,
                    onLoad: model.onLoadMore,
                    slivers: <Widget>[
                      SliverToBoxAdapter(
                        child: Container(
                          child: OpenEyeListWidget(),
                        ),
                      )
                    ]
                ),
              )
          );
        }
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => false;
}

class OpenEyeListWidget extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    OpenEyePageModel model = Provider.of(context);
    if(model.isInit){
      return LoadingWidget();
    }
    return ListView.separated(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context,index){
            var item = model.itemList[index];
            if(item.type == 'textHeader'){
              return TimeTitleItem(timeTitle: item.data.text);
            }
            return EyePageItem(item:item);
        },
        separatorBuilder: (context,index){
          var item = model.itemList[index];
          var itemNext = model.itemList[index + 1];
          if(item.type == 'textHeader' || itemNext.type == 'textHeader'){
            return Divider(
              height: 0,
              color: Color(0xFFF4F4F4),
            );
          }
          return Divider(
            height: 10,
            color: Color(0xFFF4F4F4),
          );
        },
        itemCount: model.itemList.length,
    );
  }
}

