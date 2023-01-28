import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:recipes_app/src/presentation/modules/home/navigation/home_routes.dart';
import 'package:recipes_app/src/presentation/navigation/core/route_path.dart';

enum AppNavigationCategories {
  home,
}

extension AppNavigationCategoriesX on AppNavigationCategories {
  RoutePath routePath(){
    switch (this) {
      case AppNavigationCategories.home:
        return const RouteHome();
    }
  }

  IconData icon(BuildContext context){
    switch (this) {
      case AppNavigationCategories.home:
        return PlatformIcons(context).home;
    }
  }
}
