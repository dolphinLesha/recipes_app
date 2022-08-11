import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'theme_state.freezed.dart';

// part 'navigation_state.g.dart';

@freezed
class ThemeState with _$ThemeState {
  const factory ThemeState({
    @JsonKey() ThemeData? currentTheme,
  }) = _ThemeState;

// factory NavigationState.fromJson(Map<String, dynamic> json) => _$NavigationStateFromJson(json);
}
