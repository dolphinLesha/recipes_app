import 'package:recipes_app/src/presentation/modules/home/navigation/home_routes.dart';
import 'package:recipes_app/src/presentation/navigation/unknown_route.dart';

import 'core/navigation_route.dart';
import 'core/route_maps.dart';
import 'core/route_path.dart';

class RouteUnknown extends RoutePath {
  const RouteUnknown() : super();
}

List<NavigationRoute> defaultRoutes = [
  NavigationRoute(
    routePath: const RouteUnknown(),
    location: '/',
    screen: const UnknownScreen(),
  ),
];

List<NavigationRoute> appRouteList = [
  ...defaultRoutes,
  ...homeRoutes,
];

Map<Type, NavigationRoute> appRoutesMap =
    RoutesGenerator.generateRoutesMap(appRouteList);
Map<String, NavigationRoute> appRoutesMapByLocation =
    RoutesGenerator.generateRoutesMapWithLocationAsKey(appRouteList);
