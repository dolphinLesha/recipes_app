import 'package:recipes_app/src/presentation/modules/settings/settings_appearance_page.dart';
import 'package:recipes_app/src/presentation/modules/settings/settings_main_page.dart';
import 'package:recipes_app/src/presentation/navigation/app_navigation_categories/app_nav_categories.dart';
import 'package:recipes_app/src/presentation/navigation/core/navigation_route.dart';
import 'package:recipes_app/src/presentation/navigation/core/route_path.dart';

class RouteSettingsMain extends RoutePath {
  const RouteSettingsMain() : super();
}

class RouteSettingsAppearance extends RoutePath {
  const RouteSettingsAppearance() : super();
}

List<NavigationRoute> settingsRoutes = [
  NavigationRoute(
    routePath: const RouteSettingsMain(),
    location: '/settings/',
    screen: const SettingsMainPage(),
    category: AppNavigationCategory.settings,
  ),
  NavigationRoute(
    routePath: const RouteSettingsAppearance(),
    location: '/settings/appearance/',
    screen: const SettingsAppearancePage(),
    category: AppNavigationCategory.settings,
    title: 'Внешний вид',
    hasReturnButton: true,
  ),
];