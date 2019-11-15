import 'package:flutter/material.dart';
import 'package:flutter_phoenix/home/bean/eye_bean_entity.dart';
import 'package:flutter_phoenix/net/openeye_dao.dart';
import 'package:provider/provider.dart';

class OpenEyePage extends StatefulWidget {
  @override
  _OpenEyePageState createState() => _OpenEyePageState();
}

class _OpenEyePageState extends State<OpenEyePage> {

  OpenEyeBeanEntity _openEyeBeanEntity;
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
      _openEyeBeanEntity = value;
      openeye = value.toString();
    });

  }
  @override
  Widget build(BuildContext context) {

    return Container(
      child: Center(
        child: Text(
          '开眼看世界'
        ),
      ),
    );
  }
}

