import 'package:recipes_app/src/presentation/modules/home/navigation/home_routes.dart';
import 'package:recipes_app/src/presentation/modules/splash/navigation/splash_routes.dart';
import 'package:recipes_app/src/presentation/modules/test/navigation/test_routes.dart';
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
    location: '/unknown/',
    screen: const UnknownScreen(),
  ),
];

List<NavigationRoute> appRouteList = [
  // ...defaultRoutes,
  ...homeRoutes,
  ...splashRoutes,
  ...testRoutes,
];

Map<Type, NavigationRoute> appRoutesMap =
    RoutesGenerator.generateRoutesMap(appRouteList);
Map<String, NavigationRoute> appRoutesMapByLocation =
    RoutesGenerator.generateRoutesMapWithLocationAsKey(appRouteList);
