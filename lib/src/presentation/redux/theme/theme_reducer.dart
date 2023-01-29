import 'package:recipes_app/src/model/redux/app/app_state/app_state.dart';
import 'package:recipes_app/src/presentation/redux/theme/theme_actions.dart';
import 'package:redux/redux.dart';


class ThemeReducer {
  static final reducer = combineReducers<AppState>([
    TypedReducer<AppState, ThemeChanged>(ThemeReducer._onThemeChanged),
  ]);

  static AppState _onThemeChanged(AppState state, ThemeChanged action) {
    // print(action.theme.canvasColor);
    return state.copyWith.themeState(currentThemeMode: action.themeMode);
  }
}
