import 'dart:async';

import 'package:custom_drawer_app/bloc/general/bloc.dart';
import 'package:custom_drawer_app/models/brush.dart';
import 'package:custom_drawer_app/models/line.dart';
import 'package:flutter/material.dart';

class LinesBloc extends Bloc {
  Brush _currentLineBrush = Brush.defaultParameters();
  Line _currentLine;
  List<Line> _lines = [];

  final _linesController = StreamController<List<Line>>.broadcast();
  Stream<List<Line>> get linesStream => _linesController.stream;

  final _brushController = StreamController<Brush>.broadcast();
  Stream<Brush> get brushStream => _brushController.stream;

  void newLineAt(Offset offset) {
    _lines.add(Line(_currentLineBrush));
    _currentLine = _lines.last;
    _currentLine.offsets.add(offset);
    _linesController.sink.add(_lines);
  }

  void addPointAt(Offset offset) {
    _currentLine.offsets.add(offset);
    // _lines.clear(); // - for debugging purposes, should be deleted in production
    _linesController.sink.add(_lines);
  }

  void finishLineAt(Offset offset) {
    // _currentLine.add(offset);
    // _currentLine = [];
    _linesController.sink.add(_lines);
  }

  void setColor(Color color) {
    _currentLineBrush = _currentLineBrush.copyWith(color: color);
    _currentLineBrush.color = color;
    _brushController.sink.add(_currentLineBrush);
  }

  void setWidth(double width) {
    _currentLineBrush = _currentLineBrush.copyWith(width: width);
    _currentLineBrush.width = width;
    _brushController.sink.add(_currentLineBrush);
  }

  @override
  void dispose() {
    _linesController.close();
    _brushController.close();
  }
}
