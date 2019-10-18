import 'dart:async';
import 'dart:math';

import 'package:flutter_phoenix/clock/clock_dial_painter.dart';
import 'package:flutter_phoenix/clock/clock_hands.dart';

import 'clock_text.dart';
import 'package:flutter/material.dart';
import 'clock_face.dart';

typedef TimeProducer = DateTime Function();

class Clock extends StatefulWidget {

  final Color circleColor;
  final Color shadowColor;
  //final bool showBellsAndLegs;
  //final Color bellColor;
  //final Color legColor;
  final ClockText clockText;
  //final bool showHourHandleHeartShape;
  final TimeProducer getCurrentTime;
  final Duration updateDuration;

  Clock({this.circleColor = const Color(0xfffe1ecf7),
         this.shadowColor = const Color(0xffd9e2ed),
         //this.showBellsAndLegs = true,
         //this.bellColor = const Color(0xFF333333),
         //this.legColor = const Color(0xFF555555),
         this.clockText = ClockText.arabic,
         //this.showHourHandleHeartShape = false,
         this.getCurrentTime = getSystemTime,
         this.updateDuration = const Duration(seconds: 1)});

  static DateTime getSystemTime() {
    return new DateTime.now();
  }

  @override
  State<StatefulWidget> createState() {
    return _Clock();
  }
}

class _Clock extends State<Clock> {
  Timer _timer;
  DateTime dateTime;

  @override
  void initState() {
    super.initState();
    dateTime = new DateTime.now();
    this._timer = new Timer.periodic(widget.updateDuration, setTime);
  }

  void setTime(Timer timer) {
    setState(() {
      dateTime = new DateTime.now();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new AspectRatio(
      aspectRatio: 1.0,
      child: buildClockCircle(context),
//      child: (widget.showBellsAndLegs)? new Stack(
//          children: <Widget>[
//            new Container(
//              width: double.infinity,
//              child: new CustomPaint(
//                //painter: new BellsAndLegsPainter(bellColor: widget.bellColor, legColor: widget.legColor),
//              ),
//            ),
//
//            buildClockCircle(context)
//          ]
//      ) : buildClockCircle(context),

    );
  }

  Container buildClockCircle(BuildContext context) {
    return new Container(
      width: double.infinity,
      decoration: new BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.transparent,
        boxShadow: [
          new BoxShadow(
            offset: new Offset(0.0, 5.0),
            blurRadius: 5.0,
            color: widget.shadowColor
          ),
          BoxShadow(
            offset: Offset(0.0,5.0),
            color: widget.circleColor,
            blurRadius: 10,
            spreadRadius: -15,

          )
        ],
      ),

      child: Stack(
        children: <Widget>[
          new ClockFace(
            clockText: widget.clockText,
            dateTime: dateTime,
          ),
          Container(
            padding: EdgeInsets.all(25),
            width: double.infinity,
            child: new CustomPaint(
              painter: new ClockDialPainter(clockText: widget.clockText),
            ),
          ),
          new ClockHands(dateTime: dateTime),
        ],
      )
    );
  }

}


//class BellsAndLegsPainter extends CustomPainter{
//  final Color bellColor;
//  final Color legColor;
//  final Paint bellPaint;
//  final Paint legPaint;
//
//  BellsAndLegsPainter({this.bellColor = const Color(0xFF333333), this.legColor = const Color(0xFF555555)}):
//      bellPaint= new Paint(),
//      legPaint= new Paint() {
//      bellPaint.color= bellColor;
//      bellPaint.style= PaintingStyle.fill;
//
//    legPaint.color= legColor;
//    legPaint.style= PaintingStyle.stroke;
//    legPaint.strokeWidth= 10.0;
//    legPaint.strokeCap= StrokeCap.round;
//  }
//
//  @override
//  void paint(Canvas canvas, Size size) {
//    final radius = size.width / 2;
//    canvas.save();
//
//    canvas.translate(radius, radius);
//
//    //draw the handle
//    Path path = new Path();
//    path.moveTo(-60.0, -radius-10);
//    path.lineTo(-50.0, -radius-50);
//    path.lineTo(50.0, -radius-50);
//    path.lineTo(60.0, -radius-10);
//
//    canvas.drawPath(path, legPaint);
//
//    //draw right bell and left leg
//    canvas.rotate(2*pi/12);
//    drawBellAndLeg(radius, canvas);
//
//    //draw left bell and right leg
//    canvas.rotate(-4*pi/12);
//    drawBellAndLeg(radius, canvas);
//
//    canvas.restore();
//
//  }
//
//  //helps draw the leg and bell
//  void drawBellAndLeg(radius, canvas){
//    //bell
//    Path path1 = new Path();
//    path1.moveTo(-55.0, -radius-5);
//    path1.lineTo(55.0, -radius-5);
//    path1.quadraticBezierTo(0.0, -radius-75, -55.0, -radius-10);
//
//    //leg
//    Path path2= new Path();
//    path2.addOval(new Rect.fromCircle(center: new Offset(0.0, -radius-50), radius: 3.0));
//    path2.moveTo(0.0, -radius-50);
//    path2.lineTo(0.0, radius+20);
//
//    //draw the bell on top on the leg
//    canvas.drawPath(path2, legPaint);
//    canvas.drawPath(path1, bellPaint);
//  }
//
//  @override
//  bool shouldRepaint(CustomPainter oldDelegate) {
//    return false;
//  }
//}
