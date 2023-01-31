import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app/src/model/bloc/theme/actions.dart';
import 'package:recipes_app/src/model/bloc/theme/state/theme_state.dart';
export 'actions.dart';

class ThemeBloc extends Bloc<ThemeAction, ThemeState> {

  static final ThemeBloc _bloc = ThemeBloc._internal();

  ThemeBloc._internal() : super(const ThemeState(
  )) {
    on<ThemeChanged>(_themeChanged);
  }

  factory ThemeBloc() {
    return _bloc;
  }

  void _themeChanged (
      ThemeChanged event, Emitter<ThemeState> emit) async {
    emit (
        state.copyWith(currentThemeMode: event.themeMode)
    );
  }


}