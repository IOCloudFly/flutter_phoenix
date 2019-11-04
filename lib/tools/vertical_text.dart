import 'package:flutter/material.dart';


class VerticalText extends CustomPainter{

  String text;
  double width;
  double height;
  TextStyle textStyle;
  int number=0;

  VerticalText(
      {@required this.text,
        @required this.textStyle,
        @required this.width,
        @required this.height,
      });


  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    var paint = new Paint();
    paint.color = textStyle.color;
    double offsetX = width;
    double offsetY = 0;
    bool newLine = true;
    double maxWidth = 0;

    maxWidth = findMaxWidth(text,textStyle);



    text.runes.forEach((rune){
      String str = new String.fromCharCode(rune);
      TextSpan span = new TextSpan(style: textStyle,text: str);
      TextPainter tp = new TextPainter(
          text: span,
          textAlign: TextAlign.center,
          textDirection: TextDirection.ltr
      );
      tp.layout();
      if(text.substring(number,number+1)==" "){
        print(number);
        newLine = true;
        offsetY = 0;
      }
////  if(offsetY + tp.height > height){
//        print("newLine");
//        newLine = true;
//        offsetY = 0;
//      }

      if(newLine){
//        print("newLine");
        offsetX -= maxWidth;
        newLine = false;
      }

      if(offsetX < -maxWidth){
        return;
      }

      tp.paint(canvas, new Offset(offsetX, offsetY));
      offsetY += tp.height;
      number+=1;
    });
  }
//


  double findMaxWidth(String text, TextStyle style) {
    double maxWidth = 0;

    text.runes.forEach((rune){
      String str = new String.fromCharCode(rune);
      TextSpan span = new TextSpan(style: style,text: str);
      TextPainter tp = new TextPainter(
          text: span,
          textAlign: TextAlign.center,
          textDirection: TextDirection.ltr
      );
      tp.layout();
      maxWidth = max(maxWidth,tp.width);
    });
    return maxWidth;
  }

  @override
  bool shouldRepaint(VerticalText oldDelegate) {
    // TODO: implement shouldRepaint
    return oldDelegate.text != text ||
        oldDelegate.textStyle != textStyle ||
        oldDelegate.width != width ||
        oldDelegate.height != height;
  }

  double max(double a, double b) {
    if(a > b){
      return a;
    }else{
      return b;
    }
  }

}