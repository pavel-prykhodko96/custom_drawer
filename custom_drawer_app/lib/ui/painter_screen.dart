import 'package:custom_drawer_app/bloc/general/bloc_provider.dart';
import 'package:custom_drawer_app/bloc/lines_bloc.dart';
import 'package:custom_drawer_app/models/line.dart';
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
    LinesBloc linesBloc = BlocProvider.of<LinesBloc>(context);

    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.grey,
      body: SizedBox.expand(
        child: UnconstrainedBox(
          child: GestureDetector(
            onPanStart: (details) => linesBloc.newLineAt(details.localPosition),
            onPanUpdate: (details) =>
                linesBloc.addPointAt(details.localPosition),
            child: StreamBuilder<List<Line>>(
              stream: linesBloc.linesStream,
              builder: (context, snapshot) {
                return Container(
                  color: Colors.white,
                  child: CustomPaint(
                    size: painterAreaSize,
                    painter: snapshot.hasData ? Painter(snapshot.data) : null,
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
