import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_phoenix/home/bean/eye_open_bean.dart';
import 'package:flutter_phoenix/net/openeye_dao.dart';
import 'package:provider/provider.dart';

///开眼page
class OpenEyePage extends StatefulWidget {
  @override
  _OpenEyePageState createState() => _OpenEyePageState();
}

class _OpenEyePageState extends State<OpenEyePage> {

  EyeOpenBean eyeOpenBean;
  IssueList  issueList;
  List<ItemList> itemList = [];
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
      //itemList = value;
    });

  }
  @override
  Widget build(BuildContext context) {

    return Container(

      child: Center(
        child: Text(
          openeye,
        ),
      ),
    );
  }
}

