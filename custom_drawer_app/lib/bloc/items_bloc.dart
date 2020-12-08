import 'dart:async';

import 'package:custom_drawer_app/bloc/general/bloc.dart';
import 'package:custom_drawer_app/models/paint_items/paint_item.dart';
import 'package:flutter/material.dart';

enum PaintItemType { Clear, Erase, Fill, Pencil }

class ItemsBloc extends Bloc {
  PaintItemType _currentPaintItemType = PaintItemType.Pencil;
  PaintItem _currentPaintItem;
  List<PaintItem> _paintItems = [];
  List<PaintItem> _undidPaintItems = [];

  final _linesController = StreamController<List<PaintItem>>.broadcast();
  Stream<List<PaintItem>> get linesStream => _linesController.stream;

  final _undidLinesController = StreamController<List<PaintItem>>.broadcast();
  Stream<List<PaintItem>> get undidLinesStream => _undidLinesController.stream;

  final _brushController = StreamController<PaintItem>.broadcast();
  Stream<PaintItem> get brushStream => _brushController.stream;

  @override
  void dispose() {
    _linesController.close();
    _undidLinesController.close();
    _brushController.close();
  }
}
