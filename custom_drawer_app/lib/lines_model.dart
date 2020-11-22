import 'package:flutter/material.dart';

class LinesModel {
  static List<Offset> _currentLine = [];
  static List<List<Offset>> _lines = [];

  static List<List<Offset>> get lines => _lines;

  static newLineAt({@required Offset offset}) {
    _lines.add(List<Offset>());
    _currentLine = _lines.last;
    _currentLine.add(offset);
  }

  static addOffset(Offset offset) {
    _currentLine.add(offset);
    // _lines.clear(); // - for debugging purposes, should be deleted in production
  }
}
