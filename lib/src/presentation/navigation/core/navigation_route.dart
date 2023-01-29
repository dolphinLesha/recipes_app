import 'package:flutter/material.dart';
import 'package:recipes_app/src/presentation/navigation/app_navigation_categories/app_nav_categories.dart';
import 'package:recipes_app/src/presentation/navigation/core/route_path.dart';

class NavigationRoute {
  final RoutePath routePath;
  final RoutePath Function(
      {required RoutePath route,
      required bool isUserAuthenticated,
      required RoutePath defaultAuthRoute,
      required RoutePath defaultUnAuthRoute})? routeValidator;
  final String? location;
  final AppNavigationCategory? category;
  final Widget screen;

  NavigationRoute({
    required this.routePath,
    this.routeValidator,
    this.location,
    this.category,
    required this.screen,
  });

  RoutePath getValidatedRoute({
    required bool isUserAuthenticated,
    required RoutePath defaultAuthRoute,
    required RoutePath defaultUnAuthRoute,
  }) {
    return routeValidator != null
        ? routeValidator!(
            route: routePath,
            isUserAuthenticated: isUserAuthenticated,
            defaultAuthRoute: defaultAuthRoute,
            defaultUnAuthRoute: defaultUnAuthRoute,
          )
        : routePath;
  }

  @override
  String toString() {
    return 'NavigationRoute{routePath: $routePath, routeValidator: $routeValidator, location: $location, category: $category, screen: $screen}';
  }
}
