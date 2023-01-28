import 'package:recipes_app/src/presentation/modules/test/test_screen.dart';
import 'package:recipes_app/src/presentation/navigation/app_navigation_categories/app_nav_categories.dart';
import 'package:recipes_app/src/presentation/navigation/core/navigation_route.dart';
import 'package:recipes_app/src/presentation/navigation/core/route_path.dart';

class RouteTest extends RoutePath {
  const RouteTest() : super();
}

List<NavigationRoute> testRoutes = [
  NavigationRoute(
    routePath: const RouteTest(),
    location: '/test/',
    screen: const TestScreen(),
    category: AppNavigationCategory.test,
  ),
];