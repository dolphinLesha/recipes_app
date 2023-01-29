import 'package:recipes_app/src/model/redux/navigation/navigation_state/navigation_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipes_app/src/model/redux/theme/theme_state/theme_state.dart';
import 'package:recipes_app/src/model/redux/user/user_state/user_state.dart';


part 'app_state.freezed.dart';
// part 'app_state.g.dart';

// enum Status { initial, loading, failure, success }

@freezed
class AppState with _$AppState {
  const factory AppState({
    required NavigationState navigationState,
    @Default(ThemeState()) ThemeState themeState,
    @Default(UserState()) UserState userState,
  }) = _AppState;

// factory AppState.fromJson(Map<String, dynamic> json) =>
//     _$AppStateFromJson(json);
}
