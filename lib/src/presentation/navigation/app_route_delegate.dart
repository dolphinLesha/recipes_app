import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipes_app/di.dart';
import 'package:recipes_app/src/model/bloc/navigation/bloc.dart';
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
    return Navigator(
      key: navigatorKey,
      pages: [
        MaterialPage(
          key: ValueKey(currentConfiguration.runtimeType),
          child: const RouterScreen(),
        ),
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }

        notifyListeners();
        return true;
      },
    );
  }

  @override
  GlobalKey<NavigatorState>? get navigatorKey => GlobalKey<NavigatorState>();

  @override
  RoutePath get currentConfiguration =>
      DI.navigationBloc.state.currentRoute;

  @override
  Future<void> setNewRoutePath(RoutePath configuration) async {
    if (DI.navigationBloc.state.currentRoute!=configuration){
      DI.navigationBloc.add(RouteChanged(route: configuration));
    }
  }
}
