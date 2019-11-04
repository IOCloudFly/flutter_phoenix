import 'package:flutter/material.dart';
import 'package:flutter_phoenix/tools/vertical_text.dart';

class TravelPage extends StatefulWidget {
  @override
  _TravelPageState createState() => _TravelPageState();
}

class _TravelPageState extends State<TravelPage> {

  String poetry_str = " 剑气纵横三万里，一剑光寒十九州。";

  @override
  void initState() {
    // TODO: implement initState
    poetry_str = poetry_str
        .replaceAll("。", " ")
        .replaceAll("，", " ")
        .replaceAll("？", " ");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomPaint(
          painter: VerticalText(
            text: poetry_str,
            textStyle: TextStyle(
              color: Colors.black,
              fontSize: 15,
              letterSpacing: 4,
              wordSpacing: 4,
              fontFamily: "SF-Pro-Text-Regular",
            ),
            width:40.0,
            height: 180.0,
          ),
        ),
      ),
    );
  }
}

