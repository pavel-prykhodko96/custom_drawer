import 'package:custom_drawer_app/bloc/general/bloc_provider.dart';
import 'package:custom_drawer_app/bloc/items_bloc.dart';
import 'package:custom_drawer_app/models/paint_items/paint_item.dart';
import 'package:custom_drawer_app/ui/buttons_panel.dart';
import 'package:custom_drawer_app/painter/painter.dart';
import 'package:flutter/material.dart';

class PainterScreen extends StatefulWidget {
  @override
  _PainterScreenState createState() => _PainterScreenState();
}

class _PainterScreenState extends State<PainterScreen> {
  @override
  void initState() {
    super.initState();
  }

  Size get painterAreaSize {
    final screenWidth = MediaQuery.of(super.context).size.width;
    return Size(screenWidth, screenWidth); // square
  }

  @override
  Widget build(BuildContext context) {
    ItemsBloc itemsBloc = BlocProvider.of<ItemsBloc>(context);

    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.grey,
      body: SizedBox.expand(
        child: UnconstrainedBox(
          child: GestureDetector(
            // onPanStart: (details) => itemsBloc.newLineAt(details.localPosition),
            // onPanUpdate: (details) => itemsBloc.addPointAt(details.localPosition),
            child: StreamBuilder<List<PaintItem>>(
              stream: itemsBloc.linesStream,
              builder: (context, snapshot) {
                return Container(
                  color: Colors.white,
                  child: ClipRect(
                    // ClipRect is for not drawing outside square
                    child: CustomPaint(
                      size: painterAreaSize,
                      painter: snapshot.hasData ? Painter(snapshot.data) : null,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
      bottomNavigationBar: ButtonsPanel(),
    );
  }
}
