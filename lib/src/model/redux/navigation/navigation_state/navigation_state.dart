import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipes_app/src/presentation/modules/authentication/navigation/auth_routes.dart';
import 'package:recipes_app/src/presentation/modules/home/navigation/home_routes.dart';
import 'package:recipes_app/src/presentation/modules/splash/load_app_screen.dart';
import 'package:recipes_app/src/presentation/modules/splash/navigation/splash_routes.dart';
import 'package:recipes_app/src/presentation/navigation/app_navigation_categories/app_nav_categories.dart';

import '../../../../presentation/navigation/core/route_path.dart';

part 'navigation_state.freezed.dart';

// part 'navigation_state.g.dart';

@freezed
class NavigationState with _$NavigationState {
  const factory NavigationState({
    @Default(RouteWelcome()) RoutePath currentRoute,
    AppNavigationCategory? navigationCategory,
    List<IconData>? navigationIcons,
    required Map<AppNavigationCategory, List<RoutePath>> navigationHistory,
  }) = _NavigationState;

// factory NavigationState.fromJson(Map<String, dynamic> json) => _$NavigationStateFromJson(json);
}
