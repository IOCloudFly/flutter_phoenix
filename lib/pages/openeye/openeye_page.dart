import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_phoenix/home/bean/eye_open_bean.dart';
import 'package:flutter_phoenix/net/openeye_dao.dart';
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

class _OpenEyePageState extends State<OpenEyePage> {

  EyeOpenBean eyeOpenBean;
  IssueList  issueList;
  List<ItemList> itemList = [];
  EyeOpenBean   openData;
  String openeye = " ";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getOpenEye();
  }

  Future _getOpenEye() async{
    var value = await OpenEyeDao.getInstance().getEyeBean();
    setState(() {
      openData = value;
    });

  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('每日精选',style: TextStyle(
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
            onPressed: (){

            },
          )
        ],
      ),
      body: Center(
        child: Text(
        null==openData?'':  openData.issueList[0].itemList[1].data.title
        ),
      ),
      
    );
  }
}

