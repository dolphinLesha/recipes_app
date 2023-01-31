import 'package:recipes_app/src/presentation/navigation/app_navigation_categories/app_nav_categories.dart';
import 'package:recipes_app/src/presentation/navigation/core/route_path.dart';

abstract class NavigationAction {
  const NavigationAction();
}

class RouteChanged extends NavigationAction {
  final RoutePath? route;
  final AppNavigationCategory? category;
  final RoutePath? previousRoute;

  RouteChanged({
    this.route,
    this.category,
    this.previousRoute,
  });
}

class RoutePop extends NavigationAction {
  const RoutePop();
}
