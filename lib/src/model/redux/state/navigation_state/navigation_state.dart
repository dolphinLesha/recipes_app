import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipes_app/src/presentation/modules/home/navigation/home_routes.dart';
import 'package:recipes_app/src/presentation/modules/splash/load_app_screen.dart';
import 'package:recipes_app/src/presentation/modules/splash/navigation/splash_routes.dart';

import '../../../../presentation/navigation/core/route_path.dart';

part 'navigation_state.freezed.dart';

// part 'navigation_state.g.dart';

@freezed
class NavigationState with _$NavigationState {
  const factory NavigationState({
    @JsonKey() @Default(RouteLoadAppSplash()) RoutePath currentRoute,
    List<IconData>? navigationIcons,
  }) = _NavigationState;

// factory NavigationState.fromJson(Map<String, dynamic> json) => _$NavigationStateFromJson(json);
}
