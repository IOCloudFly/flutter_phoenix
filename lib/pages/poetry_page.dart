import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_phoenix/tools/vertical_text.dart';

class PoetryPage extends StatefulWidget {
  @override
  _PoetryPageState createState() => _PoetryPageState();
}

class _PoetryPageState extends State<PoetryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: new Card(
          elevation: 6,
          color: Colors.white,
          child: Container(
            color: Colors.transparent,
            width: 300.0,
            height: 500.0,
            child: Column(

              children: <Widget>[

                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: new ClipOval(
                    child: new SizedBox(
                      width: 200.0,
                      height: 200.0,
                      child: new Image.asset(
                        "assets/image_01.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: CustomPaint(
                          painter: VerticalText(
                              text: "剑气纵横三万里,一剑光寒十九州。",
                              textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                letterSpacing: 6,
                                wordSpacing: 4,

                              ),
                            width: 50.0,
                            height: 180.0,
                          ),
                      ),
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
