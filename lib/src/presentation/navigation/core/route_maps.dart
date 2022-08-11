import 'navigation_route.dart';

class RoutesGenerator {
  static Map<Type, NavigationRoute> generateRoutesMap(
      List<NavigationRoute> routesList) {
    return {
      for (var route in routesList) route.routePath.runtimeType: route,
    };
  }

  static Map<String, NavigationRoute> generateRoutesMapWithLocationAsKey(
      List<NavigationRoute> routesList) {
    return {
      for (var route in routesList)
        if (route.location != null) route.location!: route,
    };
  }
}
