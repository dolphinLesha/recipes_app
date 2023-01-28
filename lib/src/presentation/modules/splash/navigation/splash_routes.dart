import 'package:recipes_app/src/presentation/modules/splash/load_app_screen.dart';
import 'package:recipes_app/src/presentation/navigation/app_navigation_categories/app_nav_categories.dart';

import '../../../navigation/core/navigation_route.dart';
import '../../../navigation/core/route_path.dart';

class RouteLoadAppSplash extends RoutePath {
  const RouteLoadAppSplash() : super();
}

List<NavigationRoute> splashRoutes = [
  NavigationRoute(
    routePath: const RouteLoadAppSplash(),
    location: '/',
    screen: const LoadAppSplashScreen(),
    // category: AppNavigationCategory.test,
  ),
];
