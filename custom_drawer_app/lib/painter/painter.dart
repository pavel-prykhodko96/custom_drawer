import 'package:custom_drawer_app/models/line.dart';
import 'package:flutter/material.dart';

class Painter extends CustomPainter {
  final List<Line> _lines;

  Painter(List<Line> lines) : _lines = lines;

  @override
  void paint(Canvas canvas, Size size) {
    if (_lines == null) return;
    for (var line in _lines) {
      final offsets = line.offsets;
      final brush = line.brush;

      if (offsets.length == 1) {
        canvas.drawLine(
          offsets[0],
          offsets[0],
          Paint()
            ..color = brush.color
            ..strokeWidth = brush.width,
        );
      } else {
        for (var i = 0; i < offsets.length - 1; ++i) {
          canvas.drawLine(
            offsets[i],
            offsets[i + 1],
            Paint()
              ..color = brush.color
              ..strokeWidth = brush.width,
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
