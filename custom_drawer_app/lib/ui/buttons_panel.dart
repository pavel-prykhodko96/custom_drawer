import 'package:flutter/material.dart';

class ButtonsPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
              onPressed: null,
            ),
          ),
          Expanded(
            child: IconButton(
              icon: Icon(Icons.brush),
              onPressed: null,
            ),
          ),
        ],
      ),
    );
  }
}
