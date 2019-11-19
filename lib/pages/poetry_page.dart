import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_phoenix/home/bean/poetry_bean_entity.dart';
import 'package:flutter_phoenix/net/http_utils.dart';
import 'package:flutter_phoenix/tools/vertical_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PoetryPage extends StatefulWidget {
  @override
  _PoetryPageState createState() => _PoetryPageState();
}

class _PoetryPageState extends State<PoetryPage> {
  PoetryBeanData poetryListBean;

  @override
  void initState() {

    super.initState();
    _getData();
  }

  Future _getData() async {
    var  value  = await HttpUtils.getInstance().getSentence();
    setState(() {
      poetryListBean=value;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: new Card(
          elevation: 6,
          color: Colors.white,
          child: Container(
            color: Colors.transparent,
            width: 300.0,
            height: 500.0,
            child: Column(
              children: <Widget>[
                toImage(),
                bottomZone(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  toImage(){
    return Container(
        padding: const EdgeInsets.only(top: 30.0),
        child: new ClipOval(
          child:new SizedBox(
            width: 200.0,
            height: 200.0,
            child: new Image.asset(
                'assets/image_01.png',
                fit: BoxFit.fill,
            ),
          ),
        ),
    );
  }

  bottomZone(){
    return Container(
        width: 300.0,
        height: 200.0,
        child: Stack(
            children: <Widget>[
              centerText(),
              rightLogo(),
            ],
        ),
    );
  }

  rightLogo(){
    return Positioned(
      right: 30,
      bottom: 5,
      child: Container(
        width: 25.0,
        height: 25.0,
        margin: const EdgeInsets.only(top: 200),
        decoration: BoxDecoration(
          color: Color(0xFFB71C1C),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Container(
            child: Center(
              child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Center(
                    child: Text(
                      '印',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                    ),
                  ),
              ),
            ),
        ),
      ),
    );
  }

  centerText(){
    return Positioned(
      left: 90,
      top: 10,
      child: Container(
          width: 100.0,
          height: 180.0,
          margin: EdgeInsets.only(left: 30.0),
          child: new CustomPaint(
            painter: VerticalText(
              text: poetryListBean?.content?.replaceAll("，", " ")
                  ?.replaceAll("。", " ")
                  ?.replaceAll("！", " ")
                  ?.replaceAll("？", " ")??'',
              textStyle: TextStyle(
                color: Colors.black,
                fontSize: 16,
                letterSpacing: 4,
                wordSpacing: 4,
              ),
              width: 50.0,
              height: 180.0
            ),
          ),
      ),
    );
  }


}
