import 'package:custom_drawer_app/bloc/brush_bloc.dart';
import 'package:custom_drawer_app/bloc/general/bloc.dart';
import 'package:custom_drawer_app/bloc/lines_bloc.dart';

class MainBloc extends Bloc {
  LinesBloc linesBloc = LinesBloc();
  BrushBloc brushBloc = BrushBloc();

  @override
  void dispose() {
    linesBloc.dispose();
    brushBloc.dispose();
  }
}
