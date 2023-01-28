import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:recipes_app/src/presentation/modules/home/navigation/home_routes.dart';
import 'package:recipes_app/src/presentation/modules/splash/navigation/splash_routes.dart';
import 'package:recipes_app/src/presentation/modules/test/navigation/test_routes.dart';
import 'package:recipes_app/src/presentation/navigation/core/route_path.dart';

enum AppNavigationCategory {
  home,
  test,
}

extension AppNavigationCategoriesX on AppNavigationCategory {
  RoutePath get routePath{
    switch (this) {
      case AppNavigationCategory.home:
        return const RouteHome();
      case AppNavigationCategory.test:
        return const RouteTest();
    }
  }

  IconData icon(BuildContext context){
    switch (this) {
      case AppNavigationCategory.home:
        return PlatformIcons(context).home;
      case AppNavigationCategory.test:
        return PlatformIcons(context).checkMarkCircled;
    }
  }

  String get appBarTitle{
    switch (this) {
      case AppNavigationCategory.home:
        return 'RecipeApp';
      case AppNavigationCategory.test:
        return 'Test Screen';
    }
  }
}


