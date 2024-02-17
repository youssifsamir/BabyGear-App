//packages
import 'dart:math';
import 'package:flutter/material.dart';

class CircularProgres extends StatelessWidget {
  final double value;
  CircularProgres({required this.value});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      foregroundPainter: CircularBar(
        offset: const Offset(22, 22),
        endAngle: (pi * 2 * value),
        radius: 26.5,
      ),
    );
  }
}

class CircularBar extends CustomPainter {
  var offset = const Offset(20, 20);
  var radius = 26.5;
  var endAngle = (pi * 2 * 0.5);

  CircularBar(
      {required this.offset, required this.radius, required this.endAngle});
  @override
  void paint(Canvas canvas, Size size) {
    var p = Paint()
      ..color = Colors.blue[900]!
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    canvas.drawArc(
      Rect.fromCircle(center: offset, radius: radius),
      -pi / 2,
      endAngle,
      false,
      p,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
