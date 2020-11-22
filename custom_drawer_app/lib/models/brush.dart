import 'package:flutter/material.dart';

class Brush {
  Color color;
  double width;

  Brush({@required this.color, @required this.width});

  Brush.defaultParameters() {
    color = Colors.black;
    width = 3;
  }

  Brush copyWith({
    Color color,
    double width,
  }) {
    return Brush(
      color: color ?? this.color,
      width: width ?? this.width,
    );
  }
}
