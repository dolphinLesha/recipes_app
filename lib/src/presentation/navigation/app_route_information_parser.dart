import 'package:flutter/material.dart';

import 'app_routes_config.dart';
import 'core/navigation_route.dart';
import 'core/route_path.dart';

class AppRouteInformationParser extends RouteInformationParser<RoutePath> {
  @override
  Future<RoutePath> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location!);
    final path = uri.path.split('').last == '/' ? uri.path : '${uri.path}/';

    NavigationRoute? navigationRoute = appRoutesMapByLocation[path];

    if (navigationRoute != null) {
      return navigationRoute.routePath;
    }
    return const RouteUnknown();
  }

  @override
  RouteInformation? restoreRouteInformation(RoutePath route) {
    NavigationRoute? navigationRoute = appRoutesMap[route.runtimeType];

    if (navigationRoute != null) {
      return RouteInformation(
          location: navigationRoute.location != ''
              ? navigationRoute.location
              : '/not_found/');
    }
    return const RouteInformation(location: '/not_found/');
  }
}
