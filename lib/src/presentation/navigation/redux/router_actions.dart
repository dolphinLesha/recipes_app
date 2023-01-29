import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:recipes_app/src/model/redux/app/app_state/app_state.dart';
import 'package:recipes_app/src/presentation/modules/home/navigation/home_routes.dart';
import 'package:recipes_app/src/presentation/navigation/app_navigation_categories/app_nav_categories.dart';
import 'package:recipes_app/src/presentation/navigation/app_routes_config.dart';
import 'package:recipes_app/src/presentation/navigation/core/navigation_route.dart';

import '../core/route_path.dart';

// abstract class RouteAction {}

class RouteChanged extends ReduxAction<AppState> {
  final RoutePath? route;
  final AppNavigationCategory? category;
  final List<IconData>? navigationIcons;

  RouteChanged({
    this.route,
    this.category,
    this.navigationIcons,
  });

  @override
  AppState? reduce() {
    RoutePath route;
    AppNavigationCategory? category;
    Map<AppNavigationCategory, List<RoutePath>> history = {
      ...state.navigationState.navigationHistory
    };
    if (this.route!=null){
      NavigationRoute? navigationRoute =
      appRoutesMap[this.route.runtimeType];
      if (navigationRoute!=null && navigationRoute.category!=null){
        route = this.route!;
        category = navigationRoute.category!;
        List<RoutePath> categoryHistory = [...history[category]!];
        categoryHistory.add(route);
        history[category] = categoryHistory;
      } else {
        route = this.route!;
        category = null;
        // history[category]!.add(route);
      }
    } else if (this.category!=null) {
      if (history[this.category]!.isEmpty){
        route = this.category!.routePath;
      } else {
        route = history[this.category]!.last;
      }
      category = this.category;
    }else{
      route = const RouteHome();
    }
    return state.copyWith.navigationState(
      currentRoute: route,
      navigationIcons: this.navigationIcons,
      navigationCategory: category,
      navigationHistory: history,
    );
  }


}
