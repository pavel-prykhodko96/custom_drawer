import 'package:custom_drawer_app/models/paint_items/paint_item.dart';
import 'package:flutter/material.dart';

class Brush extends PaintItem {
  Color color;
  double penWidth;
  List<Offset> offsets = [];

  Brush({@required this.color, this.penWidth});
}
