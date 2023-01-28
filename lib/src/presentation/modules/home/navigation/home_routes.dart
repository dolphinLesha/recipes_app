import 'package:recipes_app/src/presentation/navigation/app_navigation_categories/app_nav_categories.dart';

import '../../../navigation/core/navigation_route.dart';
import '../../../navigation/core/route_path.dart';
import '../home_screen.dart';

class RouteHome extends RoutePath {
  const RouteHome() : super();
}

List<NavigationRoute> homeRoutes = [
  NavigationRoute(
    routePath: const RouteHome(),
    location: '/home/',
    screen: const HomeScreen(),
    category: AppNavigationCategory.home,
  ),
];
