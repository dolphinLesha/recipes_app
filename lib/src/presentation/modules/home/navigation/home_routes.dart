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
  ),
];
