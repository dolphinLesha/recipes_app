import 'package:flutter/material.dart';
import 'package:recipes_app/src/presentation/navigation/core/route_path.dart';

class NavigationRoute {
  final RoutePath routePath;
  final RoutePath Function(
      {required RoutePath route,
      required bool isUserAuthenticated,
      required RoutePath defaultAuthRoute,
      required RoutePath defaultUnAuthRoute})? routeValidator;
  final String? location;
  final Widget screen;

  NavigationRoute({
    required this.routePath,
    this.routeValidator,
    this.location,
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
}
