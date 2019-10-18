import 'package:flutter/material.dart';


//时钟第一个选项界面
///*
///
/// 时钟第二个界面
/// 72行图表
///
///
///
///
class SecondTab extends StatelessWidget {

  final double _smallFontSize = 12;
  final double _valFontSize = 30;
  final FontWeight _smallFontWeight = FontWeight.w500;
  final FontWeight _valFontWeight = FontWeight.w700;
  final Color _fontColor = Color(0xff5b6990);
  final double _smallFontSpacing = 1.3;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30,vertical: 25),
      alignment: Alignment.topCenter,
      child: ListView(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "AVERAGE SLEEP",
                    style: TextStyle(
                      fontWeight: _smallFontWeight,
                      fontSize: _smallFontSize,
                      letterSpacing: _smallFontSpacing,
                      color: _fontColor,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                      "6.45h",
                      style: TextStyle(
                        fontWeight: _valFontWeight,
                        fontSize: _valFontSize,
                        color: _fontColor,
                      )),
                  SizedBox(height: 30),
                  Text(
                    "AVERAGE SLEEP",
                    style: TextStyle(
                      fontWeight: _smallFontWeight,
                      fontSize: _smallFontSize,
                      letterSpacing: _smallFontSpacing,
                      color: _fontColor,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "6.50h",
                    style: TextStyle(
                      fontWeight: _valFontWeight,
                      fontSize: _valFontSize,
                      color: _fontColor
                    ),
                  )
                ],
              ),
              Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  color: Color(0xfff0f5fb),
                  border: Border.all(
                    width: 8,
                    color: Color(0xffd3e1ed),
                  ),
                  borderRadius: BorderRadius.circular(3)
                ),
                padding: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "THIS WEEK",
                       style: TextStyle(
                         fontSize: _smallFontSize,
                         fontWeight: _smallFontWeight,
                         letterSpacing: _smallFontSpacing,
                         color: _fontColor
                       ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 120,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      width: double.infinity,
                      child: CustomPaint(
                        foregroundPainter: GraphPainter(),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
         SizedBox(
           height: 25,
         ),
         Container(
           padding:EdgeInsets.symmetric(vertical: 10),
           decoration: BoxDecoration(
             border: Border(
               bottom:BorderSide(
                 color: Color(0xffdde9f7),
                 width: 1.5,
               )
             )
           ),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: <Widget>[
               Text("THURSDAT",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: _fontColor
                ),
               ),
               SizedBox(
                 height: 15,
               ),
               Row(
                 children: <Widget>[
                   Text(
                     "15/10/2019",
                     style: TextStyle(
                       fontSize: 13,
                       fontWeight: FontWeight.w400,
                       letterSpacing: _smallFontSpacing,
                       color: _fontColor
                     ),
                   ),
                   SizedBox(
                     width: 25,
                   ),
                   Expanded(  //这个控件的作用是剩下的距离自动填充
                       child: Text(
                         "45.3 MINUTES",
                         style: TextStyle(
                           fontSize: 13,
                           fontWeight: FontWeight.w400,
                           letterSpacing: _smallFontSpacing,
                           color: _fontColor
                         ),
                       )
                   )
                 ],
               )
             ],
           ),
         )
        ],
        
      ),
    );
  }
}

class GraphPainter extends CustomPainter{


  Paint trackBarPaint = Paint()
  ..color = Color(0xff818aab)
  ..style = PaintingStyle.stroke
  ..strokeCap = StrokeCap.round
  ..strokeWidth = 12;




  Paint trackPaint = Paint()
  ..color = Color(0xffdee6f1)
  ..style = PaintingStyle.stroke
  ..strokeCap = StrokeCap.round
  ..strokeWidth = 12;


  @override
  void paint(Canvas canvas, Size size) {
     Path trackPath = Path();
     Path trackBarPath = Path();

     List val = [
       size.height * 0.9,
       size.height * 0.7,
       size.height * 0.6,
       size.height * 0.9,
       size.height * 0.7,
     ];

     double origin = 8;

     for(int i = 0;i < val.length; i++){
       trackPath.moveTo(origin, size.height);
       trackPath.lineTo(origin, 0);

       trackBarPath.moveTo(origin, size.height);
       trackBarPath.lineTo(origin, val[i]);

       origin = origin + size.width * 0.22;
     }

     canvas.drawPath(trackPath, trackPaint);
     canvas.drawPath(trackBarPath, trackBarPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }

}

