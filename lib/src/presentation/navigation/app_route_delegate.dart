import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:recipes_app/di.dart';
import 'package:recipes_app/src/model/bloc/navigation/bloc.dart';
import 'package:recipes_app/src/model/bloc/navigation/state/navigation_state.dart';
import 'package:recipes_app/src/presentation/core/styles/app_typography.dart';
import 'package:recipes_app/src/presentation/modules/home/home_screen.dart';
import 'package:recipes_app/src/presentation/modules/navigation_bar/navigation_bar.dart';
import 'package:recipes_app/src/presentation/navigation/app_navigation_categories/app_nav_categories.dart';
import 'package:recipes_app/src/presentation/navigation/app_routes_config.dart';
import 'package:recipes_app/src/presentation/navigation/core/navigation_route.dart';
import 'package:recipes_app/src/presentation/navigation/router_screen.dart';
// import 'package:redux/redux.dart';

import 'core/route_path.dart';

class AppRouterDelegate extends RouterDelegate<RoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<RoutePath> {
  AppRouterDelegate() {
    // DI.navigationBloc.stream.distinct().forEach((state) => notifyListeners());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(
        bloc: DI.navigationBloc,
        buildWhen: (p, n) => p.navigationStack != n.navigationStack,
        builder: (context, state) {
          print('${'_'*10}delegate');
          print(state.navigationStack);
          print(state.bottomNavigationHistory);
          print(state.currentRoute);
          return Navigator(
            key: navigatorKey,
            pages: state.navigationStack,
            onPopPage: (route, result) {
              if (!route.didPop(result)) {
                return false;
              }

              notifyListeners();
              return true;
            },
          );
        });
  }

  @override
  GlobalKey<NavigatorState>? get navigatorKey => GlobalKey<NavigatorState>();

  @override
  RoutePath get currentConfiguration => DI.navigationBloc.state.currentRoute;

  @override
  Future<void> setNewRoutePath(RoutePath configuration) async {
    print('************** setNewRoutePath $configuration');
    if (DI.navigationBloc.state.currentRoute != configuration) {
      DI.navigationBloc.add(RoutePush(route: configuration));
    }
  }
}
