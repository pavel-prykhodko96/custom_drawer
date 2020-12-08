import 'package:custom_drawer_app/models/paint_items/brush.dart';
import 'package:custom_drawer_app/models/paint_items/clear.dart';
import 'package:custom_drawer_app/models/paint_items/erase.dart';
import 'package:custom_drawer_app/models/paint_items/fill.dart';
import 'package:custom_drawer_app/models/paint_items/paint_item.dart';
import 'package:flutter/material.dart';

class Painter extends CustomPainter {
  final List<PaintItem> _paintItems;

  Painter(List<PaintItem> paintItems) : _paintItems = paintItems;

  @override
  void paint(Canvas canvas, Size size) {
    if (_paintItems == null) return;
    for (var paintItem in _paintItems) {
      if (paintItem is Brush) {
        _drawLine(canvas, paintItem.offsets, paintItem.color,
            paintItem.penWidth, 0 /*TO DO: Change type later*/
            );
      } else if (paintItem is Erase) {
        _drawLine(canvas, paintItem.offsets, Colors.white, paintItem.penWidth,
            0 /*TO DO: Change type later*/
            );
      } else if (paintItem is Fill) {
        // TO DO: implement it later with separate method
      } else if (paintItem is Clear) {
        // TO DO: implement it later with separate method
      }
    }
  }

  void _drawLine(Canvas canvas, List<Offset> offsets, Color color,
      double penWidth, int penType /*TO DO: Change type later*/) {
    if (offsets.length == 1) {
      canvas.drawLine(
        offsets[0],
        offsets[0],
        Paint()
          ..color = color
          ..strokeWidth = penWidth,
      );
    } else {
      for (var i = 0; i < offsets.length - 1; ++i) {
        canvas.drawLine(
          offsets[i],
          offsets[i + 1],
          Paint()
            ..color = color
            ..strokeWidth = penWidth,
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
