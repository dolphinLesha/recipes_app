import 'package:flutter/material.dart';
import 'package:recipes_app/src/presentation/navigation/redux/router_actions.dart';
import 'package:recipes_app/src/presentation/navigation/router_screen.dart';
import 'package:redux/redux.dart';

import '../../model/redux/state/app_state/app_state.dart';
import 'core/route_path.dart';

class AppRouterDelegate extends RouterDelegate<RoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<RoutePath> {
  final Store<AppState> store;

  AppRouterDelegate(this.store) {
    store.onChange.map((state) => state.navigationState).distinct().forEach(
      (state) {
        notifyListeners();
      },
    );
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
      store.state.navigationState.currentRoute;

  @override
  Future<void> setNewRoutePath(RoutePath configuration) async {
    store.dispatch(RouteChanged(route: configuration));
    return;
  }
}
