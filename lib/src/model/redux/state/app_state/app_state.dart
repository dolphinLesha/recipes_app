import 'package:recipes_app/src/model/redux/state/theme_state/theme_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../navigation_state/navigation_state.dart';

part 'app_state.freezed.dart';
// part 'app_state.g.dart';

// enum Status { initial, loading, failure, success }

@freezed
class AppState with _$AppState {
  const factory AppState({
    @JsonKey() @Default(NavigationState()) NavigationState navigationState,
    @JsonKey() @Default(ThemeState()) ThemeState themeState,
  }) = _AppState;

// factory AppState.fromJson(Map<String, dynamic> json) =>
//     _$AppStateFromJson(json);
}
