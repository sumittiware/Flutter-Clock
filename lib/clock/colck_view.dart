import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:math';

class ClockView extends StatefulWidget {
  @override
  _ClockViewState createState() => _ClockViewState();
}

class _ClockViewState extends State<ClockView> {
  @override
  bool _disposed = false;
  void initState() {
    // TODO: implement initState

    Timer.periodic(Duration(seconds: 1), (timer) {
      if (!_disposed) {
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _disposed = true;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final totalHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        kToolbarHeight;
    final totalWidth = MediaQuery.of(context).size.width;
    return Container(
      height: totalHeight * 0.5,
      width: totalWidth * 0.8,
      child: Transform.rotate(
        angle: -pi / 2,
        child: CustomPaint(
          painter: ClockPainter(),
        ),
      ),
    );
  }
}

class ClockPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var centerX = size.width / 2;
    var centerY = size.height / 2;
    var center = Offset(centerX, centerY);

    var radius = min(centerX, centerY);

    var datetime = DateTime.now();
    //declaring the different paintbrush to paint on canvas
    var fillbrush = Paint()..color = Color(0xFF444974);
    var outlinebrush = Paint()
      ..color = Color(0xFFEAECFF)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width / 20;
    var centerbrush = Paint()..color = Color(0xFFEAECFF);
    var dashBrush = Paint()
      ..color = Color(0xFFEAECFF)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 1;

    var dashBrush1 = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 1;

    var secHandBrush = Paint()
      ..color = Colors.orange[300]
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width / 60;
    var minHandBrush = Paint()
      ..strokeCap = StrokeCap.round
      ..shader = RadialGradient(colors: [Colors.lightBlue, Colors.pink])
          .createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width / 30;
    var hourHandBrush = Paint()
      ..strokeCap = StrokeCap.round
      ..shader = RadialGradient(colors: [Colors.amber, Colors.pink])
          .createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width / 24;

    var secHandX = centerX + radius * 0.6 * cos(datetime.second * 6 * pi / 180);
    var secHandY = centerY + radius * 0.6 * sin(datetime.second * 6 * pi / 180);

    var minHandX = centerX + radius * 0.5 * cos(datetime.minute * 6 * pi / 180);
    var minHAndY = centerY + radius * 0.5 * sin(datetime.minute * 6 * pi / 180);

    var hourHandX = centerX +
        radius *
            0.4 *
            cos((datetime.hour * 30 + datetime.minute * 0.5) * pi / 180);
    var hourHandY = centerY +
        radius *
            0.4 *
            sin((datetime.hour * 30 + datetime.minute * 0.5) * pi / 180);
    //code drwaing on the canvas
    canvas.drawCircle(center, radius * 0.75, fillbrush);
    canvas.drawCircle(center, radius * 0.75, outlinebrush);
    canvas.drawLine(center, Offset(hourHandX, hourHandY), hourHandBrush);
    canvas.drawLine(center, Offset(minHandX, minHAndY), minHandBrush);
    canvas.drawLine(center, Offset(secHandX, secHandY), secHandBrush);
    canvas.drawCircle(center, radius * 0.10, centerbrush);

    var outerCircleRadius = radius;
    var innerCircleRadius = radius * 0.9;
    for (double i = 0; i < 360; i += 12) {
      var x1 = centerX + outerCircleRadius * cos(i * pi / 180);
      var y1 = centerY + outerCircleRadius * sin(i * pi / 180);

      var x2 = centerX + innerCircleRadius * cos(i * pi / 180);
      var y2 = centerY + innerCircleRadius * sin(i * pi / 180);
      canvas.drawLine(Offset(x1, y1), Offset(x2, y2),
          (i % 3 == 0) ? dashBrush1 : dashBrush);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
