import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipes_app/src/data/common/classes/pair.dart';
import 'package:recipes_app/src/presentation/modules/authentication/navigation/auth_routes.dart';
import 'package:recipes_app/src/presentation/modules/authentication/welcome_screen.dart';
import 'package:recipes_app/src/presentation/navigation/app_navigation_categories/app_nav_categories.dart';
import 'package:recipes_app/src/presentation/navigation/app_page.dart';
import 'package:recipes_app/src/presentation/navigation/core/route_path.dart';


part 'navigation_state.freezed.dart';

// part 'navigation_state.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class NavigationState with _$NavigationState {
  const factory NavigationState({
    @Default(RouteWelcome()) RoutePath currentRoute,
    AppNavigationCategory? navigationCategory,
    required Map<AppNavigationCategory, List<Pair<RoutePath?, RoutePath>>> bottomNavigationHistory,
    @Default([AppPage(key: ValueKey(RouteWelcome), child: WelcomeScreen())]) List<Page> navigationStack,
    // RoutePath? previousRoute,
  }) = _NavigationState;

// factory NavigationState.fromJson(Map<String, dynamic> json) => _$NavigationStateFromJson(json);
}
