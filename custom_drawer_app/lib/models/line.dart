import 'package:custom_drawer_app/models/brush.dart';
import 'package:flutter/material.dart';

class Line {
  final Brush brush;
  List<Offset> offsets = [];

  Line({@required this.brush});
}
