
import 'package:flutter/material.dart';


class LinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2;

    final double centerX = size.width / 2;
    final double centerY = size.height / 2;

    // Linha horizontal no meio
    canvas.drawLine(Offset(0, centerY), Offset(size.width, centerY), paint);

    // Linha vertical até a linha horizontal no meio
    canvas.drawLine(Offset(centerX, 0), Offset(centerX, centerY), paint);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
