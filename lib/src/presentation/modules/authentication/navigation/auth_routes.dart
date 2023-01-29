import 'package:recipes_app/src/presentation/modules/authentication/welcome_screen.dart';
import 'package:recipes_app/src/presentation/navigation/core/navigation_route.dart';
import 'package:recipes_app/src/presentation/navigation/core/route_path.dart';

class RouteWelcome extends RoutePath {
  const RouteWelcome() : super();
}

List<NavigationRoute> authRoutes = [
  NavigationRoute(
    routePath: const RouteWelcome(),
    location: '/welcome/',
    screen: const WelcomeScreen(),
  ),
];