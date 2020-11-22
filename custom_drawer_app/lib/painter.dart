import 'package:custom_drawer_app/lines_model.dart';
import 'package:flutter/material.dart';

class Painter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    for (var line in LinesModel.lines) {
      if (line.length == 1) {
        canvas.drawLine(
          line[0],
          line[0],
          Paint()
            ..color = Colors.black
            ..strokeWidth = 3,
        );
      } else {
        for (var i = 0; i < line.length - 1; ++i) {
          canvas.drawLine(
            line[i],
            line[i + 1],
            Paint()
              ..color = Colors.black
              ..strokeWidth = 3,
          );
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
