import 'dart:async';

import 'package:custom_drawer_app/bloc/general/bloc.dart';
import 'package:custom_drawer_app/models/brush.dart';
import 'package:flutter/material.dart';

class BrushBloc extends Bloc {
  Brush brush = Brush();

  final _controller = StreamController<Brush>.broadcast();
  Stream<Brush> get brushStream => _controller.stream;

  void setColor(Color color) {
    brush.color = color;
    _controller.sink.add(brush);
  }

  void setWidth(double width) {
    brush.width = width;
    _controller.sink.add(brush);
  }

  @override
  void dispose() {
    _controller.close();
  }
}
