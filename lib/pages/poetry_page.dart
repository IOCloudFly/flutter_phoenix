import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_phoenix/tools/vertical_text.dart';

class PoetryPage extends StatefulWidget {
  @override
  _PoetryPageState createState() => _PoetryPageState();
}

class _PoetryPageState extends State<PoetryPage> {
  String poetry_str = "剑气纵横三万里，一剑光寒十九州。";

  @override
  void initState() {
    // TODO: implement initState
    poetry_str = poetry_str
        .replaceAll("，", " ")
        .replaceAll("。", " ")
        .replaceAll("？", " ");
    super.initState();
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
                child: Stack(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.only(top: 30.0,left: 50),
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
                     Column(
                       children: <Widget>[
                       Container(
                         width: 50.0,
                         height: 180.0,
                         alignment: Alignment.center,
                         margin: const EdgeInsets.only(top: 150),
                         padding: const EdgeInsets.only(top: 25.0),
                         child: new CustomPaint(
                           painter: VerticalText(
                             text: poetry_str,
                             textStyle: TextStyle(
                               color: Colors.black,
                               fontSize: 16,
                               letterSpacing: 4,
                               wordSpacing: 4,
                               //fontFamily: "SF-Pro-Text-Regular",
                             ),
                             width: 50.0,
                             height: 180.0,
                           ),
                         ),
                       ),
                       Align(
                         alignment: Alignment.bottomRight,
                         child: Container(
                         width: 25.0,
                         height: 25.0,
                           margin: const EdgeInsets.only(top: 10),

                           decoration: BoxDecoration(
                           color: Color(0xFFB71C1C),
                           borderRadius: BorderRadius.circular(5.0),
                         ),
                         child: Center(
                           child: Text(
                             '印',
                             style: TextStyle(
                               color: Colors.white,
                               fontSize: 10,
                             ),
                           ),
                         ),
                       ),)

                     ],),

                  ],
                ),
            ),
          ),
      ),
    );
  }
}
