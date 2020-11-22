import 'package:custom_drawer_app/bloc/brush_bloc.dart';
import 'package:custom_drawer_app/bloc/general/bloc_provider.dart';
import 'package:custom_drawer_app/bloc/general/main_bloc.dart';
import 'package:custom_drawer_app/bloc/lines_bloc.dart';
import 'package:custom_drawer_app/models/brush.dart';
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
    MainBloc mainBloc = BlocProvider.of<MainBloc>(context);
    LinesBloc linesBloc = mainBloc.linesBloc;
    BrushBloc brushBloc = mainBloc.brushBloc;

    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.grey,
      body: SizedBox.expand(
        child: UnconstrainedBox(
          child: Container(
            width: painterAreaSize.width,
            height: painterAreaSize.height, // area is square
            child: GestureDetector(
              onPanStart: (details) =>
                  linesBloc.newLineAt(details.localPosition),
              onPanUpdate: (details) =>
                  linesBloc.addPointAt(details.localPosition),
              child: StreamBuilder<List<List<Offset>>>(
                stream: linesBloc.linesStream,
                builder: (context, linesSnapshot) {
                  return StreamBuilder<Brush>(
                    stream: brushBloc.brushStream,
                    builder: (context, brushSnapshot) {
                      if (!brushSnapshot.hasData)
                        brushBloc.setColor(Colors.black);
                      return brushSnapshot.hasData
                          ? Container(
                              color: Colors.white,
                              child: CustomPaint(
                                size: painterAreaSize,
                                painter: Painter(
                                  linesSnapshot.data,
                                  brushSnapshot.data,
                                ),
                              ),
                            )
                          : Container();
                    },
                  );
                },
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: ButtonsPanel(),
    );
  }
}
