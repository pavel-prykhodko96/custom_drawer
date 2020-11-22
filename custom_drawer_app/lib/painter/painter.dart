import 'package:custom_drawer_app/models/brush.dart';
import 'package:flutter/material.dart';

class Painter extends CustomPainter {
  final List<List<Offset>> _lines;
  final Brush _brush;

  Painter(List<List<Offset>> lines, Brush brush)
      : _lines = lines,
        _brush = brush;

  @override
  void paint(Canvas canvas, Size size) {
    for (var line in _lines) {
      if (line.length == 1) {
        canvas.drawLine(
          line[0],
          line[0],
          Paint()
            ..color = _brush.color
            ..strokeWidth = _brush.width,
        );
      } else {
        for (var i = 0; i < line.length - 1; ++i) {
          canvas.drawLine(
            line[i],
            line[i + 1],
            Paint()
              ..color = _brush.color
              ..strokeWidth = _brush.width,
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
