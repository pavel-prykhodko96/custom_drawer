import 'package:custom_drawer_app/bloc/general/bloc_provider.dart';
import 'package:custom_drawer_app/bloc/lines_bloc.dart';
import 'package:flutter/material.dart';

class ButtonsPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LinesBloc linesBloc = BlocProvider.of<LinesBloc>(context);

    ///// DEBUG /////
    bool debugColorToggler = false;
    bool debugWidthToggler = false;
    ///// DEBUG END /////

    return Container(
      child: Row(
        children: [
          Expanded(
            child: IconButton(
              icon: Icon(Icons.undo),
              onPressed: null,
            ),
          ),
          Expanded(
            child: IconButton(
              icon: Icon(Icons.redo),
              onPressed: null,
            ),
          ),
          Expanded(
            child: IconButton(
              icon: Icon(Icons.share),
              onPressed: null,
            ),
          ),
          Expanded(
            child: IconButton(
              icon: Icon(Icons.color_lens),
              onPressed: () {
                ///// DEBUG /////
                if (debugColorToggler)
                  linesBloc.setColor(Colors.black);
                else
                  linesBloc.setColor(Colors.green);
                debugColorToggler = !debugColorToggler;
                ///// DEBUG END /////
              },
            ),
          ),
          Expanded(
            child: IconButton(
              icon: Icon(Icons.brush),
              onPressed: () {
                ///// DEBUG /////
                if (debugWidthToggler)
                  linesBloc.setWidth(3);
                else
                  linesBloc.setWidth(5);
                debugWidthToggler = !debugWidthToggler;
                ///// DEBUG END /////
              },
            ),
          ),
        ],
      ),
    );
  }
}