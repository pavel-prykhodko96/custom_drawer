import 'dart:async';

import 'package:custom_drawer_app/bloc/general/bloc.dart';
import 'package:custom_drawer_app/models/brush.dart';
import 'package:custom_drawer_app/models/line.dart';
import 'package:flutter/material.dart';

class LinesBloc extends Bloc {
  Brush _currentLineBrush = Brush.defaultParameters();
  Line _currentLine;
  List<Line> _lines = [];
  List<Line> _undidLines = [];

  final _linesController = StreamController<List<Line>>.broadcast();
  Stream<List<Line>> get linesStream => _linesController.stream;

  final _undidLinesController = StreamController<List<Line>>.broadcast();
  Stream<List<Line>> get undidLinesStream => _undidLinesController.stream;

  final _brushController = StreamController<Brush>.broadcast();
  Stream<Brush> get brushStream => _brushController.stream;

  void newLineAt(Offset offset) {
    _lines.add(Line(brush: _currentLineBrush));
    _currentLine = _lines.last;
    _currentLine.offsets.add(offset);
    _undidLines.clear();

    _linesController.sink.add(_lines);
    _undidLinesController.sink.add(_undidLines);
  }

  void addPointAt(Offset offset) {
    _currentLine.offsets.add(offset);

    _linesController.sink.add(_lines);
  }

  void undo() {
    if (_lines.isEmpty) {
      print("_lines must be not empty!");
      return;
    }
    _undidLines.add(_lines.removeLast());

    _linesController.sink.add(_lines);
    _undidLinesController.sink.add(_undidLines);
  }

  void redo() {
    if (_undidLines.isEmpty) return;
    _lines.add(_undidLines.removeLast());

    _linesController.sink.add(_lines);
    _undidLinesController.sink.add(_undidLines);
  }

  void setColor(Color color) {
    _currentLineBrush = _currentLineBrush.copyWith(color: color);

    _brushController.sink.add(_currentLineBrush);
  }

  void setWidth(double width) {
    _currentLineBrush = _currentLineBrush.copyWith(width: width);

    _brushController.sink.add(_currentLineBrush);
  }

  @override
  void dispose() {
    _linesController.close();
    _undidLinesController.close();
    _brushController.close();
  }
}
