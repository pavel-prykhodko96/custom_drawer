import 'package:custom_drawer_app/buttons_panel.dart';
import 'package:custom_drawer_app/lines_model.dart';
import 'package:custom_drawer_app/painter.dart';
import 'package:flutter/material.dart';

class PainterScreen extends StatefulWidget {
  @override
  _PainterScreenState createState() => _PainterScreenState();
}

class _PainterScreenState extends State<PainterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.grey,
      body: SizedBox.expand(
        child: UnconstrainedBox(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width,
            child: GestureDetector(
              onPanStart: (details) {
                setState(() {
                  LinesModel.newLineAt(offset: details.localPosition);
                });
              },
              onPanUpdate: (details) {
                setState(() {
                  LinesModel.addOffset(details.localPosition);
                });
              },
              child: Container(
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomPaint(
                      painter: Painter(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: ButtonsPanel(),
    );
  }
}
