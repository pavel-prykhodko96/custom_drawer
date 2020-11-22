import 'dart:async';

import 'package:custom_drawer_app/bloc/general/bloc.dart';
import 'package:flutter/material.dart';

class LinesBloc extends Bloc {
  List<Offset> _currentLine = [];
  List<List<Offset>> _lines = [];

  final _controller = StreamController<List<List<Offset>>>.broadcast();
  Stream<List<List<Offset>>> get linesStream => _controller.stream;

  void newLineAt(Offset offset) {
    _lines.add(List<Offset>());
    _currentLine = _lines.last;
    _currentLine.add(offset);
    _controller.sink.add(_lines);
  }

  void addPointAt(Offset offset) {
    _currentLine.add(offset);
    // _lines.clear(); // - for debugging purposes, should be deleted in production
    _controller.sink.add(_lines);
  }

  void finishLineAt(Offset offset) {
    // _currentLine.add(offset);
    // _currentLine = [];
    _controller.sink.add(_lines);
  }

  @override
  void dispose() {
    _controller.close();
  }
}
