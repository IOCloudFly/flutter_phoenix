import 'dart:math';

import 'package:flutter/material.dart';


class HourHandPainter extends CustomPainter{
  //final bool showHeartShape;
  final Paint hourHandPaint;
  int hours;
  int minutes;

  HourHandPainter({this.hours, this.minutes}):hourHandPaint= new Paint(){
    hourHandPaint.color= Color(0xff222d62);
    hourHandPaint.style= PaintingStyle.stroke;
    hourHandPaint.strokeWidth = 6.0;
    hourHandPaint.strokeCap = StrokeCap.round;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final radius = size.width/2;
    // To draw hour hand
    canvas.save();

    canvas.translate(radius, radius);

    //checks if hour is greater than 12 before calculating rotation
    canvas.rotate(this.hours>=12?
    2*pi*((this.hours-12)/12 + (this.minutes/720)):
    2*pi*((this.hours/12)+ (this.minutes/720))
    );


    Path path= new Path();

    path.moveTo(0.0, -radius * 0.5);
    path.lineTo(0.0, radius * 0.1);
//    if (showHeartShape) {
//      //heart shape head for the hour hand
//      path.moveTo(0.0, -radius + radius*15.0/137.5);
//      path.quadraticBezierTo(radius*(-3.5)/137.5, -radius + radius*25.0/137.5, radius*(-15.0)/137.5, -radius + radius / 4);
//      path.quadraticBezierTo(
//          radius*(-20.0)/137.5, -radius + radius / 3, radius*(-7.5)/137.5, -radius + radius / 3);
//      path.lineTo(0.0, -radius + radius / 4);
//      path.lineTo(7.5, -radius + radius / 3);
//      path.quadraticBezierTo(
//          radius*(20.0)/137.5, -radius + radius / 3, radius*(15.0)/137.5, -radius + radius / 4);
//      path.quadraticBezierTo(radius*(3.5)/137.5, -radius + radius*(25.0)/137.5, 0.0, -radius + radius*15.0/137.5);
//    }

    //hour hand stem
//    path.moveTo(-1.0, -radius+radius/4);
//    path.lineTo(-5.0, -radius+radius/2);
//    path.lineTo(-2.0, 0.0);
//    path.lineTo(2.0, 0.0);
//    path.lineTo(5.0, -radius+radius/2);
//    path.lineTo(1.0, -radius+radius/4);
//    path.close();

    canvas.drawPath(path, hourHandPaint);
    canvas.drawShadow(path, Colors.black, 2.0, false);


    canvas.restore();

  }

  @override
  bool shouldRepaint(HourHandPainter oldDelegate) {
    return true;
  }
}
