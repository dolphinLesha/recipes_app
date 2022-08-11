import 'package:recipes_app/src/model/redux/state/app_state/app_state.dart';
import 'package:recipes_app/src/presentation/navigation/redux/router_reducer.dart';
import 'package:recipes_app/src/presentation/redux/theme/theme_reducer.dart';
import 'package:redux/redux.dart';
import 'package:get_it/get_it.dart';

class DI {
  static Reducer<AppState> get _appReducer => combineReducers([
        NavigationReducer.reducer,
        ThemeReducer.reducer,
      ]);

  static Future<void> init() async {
    GetIt.I.registerSingleton<Store<AppState>>(Store<AppState>(
      DI._appReducer,
      initialState: const AppState(),
    ));
  }

  static Store<AppState> get store => GetIt.I<Store<AppState>>();
}
