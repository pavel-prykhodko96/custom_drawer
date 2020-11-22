import 'package:custom_drawer_app/bloc/general/bloc_provider.dart';
import 'package:custom_drawer_app/bloc/lines_bloc.dart';
import 'package:custom_drawer_app/ui/painter_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: LinesBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          backgroundColor: Colors.white,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: PainterScreen(),
      ),
    );
  }
}
