import 'package:custom_drawer_app/bloc/general/bloc_provider.dart';
import 'package:custom_drawer_app/bloc/general/main_bloc.dart';
import 'package:custom_drawer_app/ui/painter_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: MainBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
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
