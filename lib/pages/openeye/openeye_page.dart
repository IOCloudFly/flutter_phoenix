import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_phoenix/pages/openeye/eye_page_item.dart';
//import 'package:flutter_phoenix/home/bean/eye_open_bean.dart';
import 'package:flutter_phoenix/provider/openeye_page_model.dart';
import 'package:flutter_phoenix/provider/provider_widget.dart';
import 'package:flutter_phoenix/utils/loading_widget.dart';
import 'package:provider/provider.dart';



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
          //model
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
                child: OpenEyeListWidget(),
              )
          );
        }
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

class OpenEyeListWidget extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    OpenEyePageModel model = Provider.of(context);
//    if(model.isInit){
//      return LoadingWidget();
//    }
    return ListView.separated(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context,index){
            var item = model.itemList[index];
            return EyePageItem(itemList:item);
        },
        separatorBuilder: (context,index){
          //var item = model.itemList[index];
          return index % 2 == 0
              ? Divider(color: Colors.blue)
              : Divider(color: Colors.red);
        },
        itemCount: model.itemList.length,
    );
  }


}

