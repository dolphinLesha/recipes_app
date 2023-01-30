import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:recipes_app/di.dart';
import 'package:recipes_app/src/data/common/classes/pair.dart';
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
  final RoutePath? previousRoute;

  RouteChanged({
    this.route,
    this.category,
    this.navigationIcons,
    this.previousRoute,
  });

  @override
  AppState? reduce() {
    RoutePath route;
    AppNavigationCategory? category;
    Map<AppNavigationCategory, List<Pair<RoutePath?,RoutePath>>> history = {
      ...state.navigationState.navigationHistory
    };
    if (this.route!=null){
      NavigationRoute? navigationRoute =
      appRoutesMap[this.route.runtimeType];
      if (navigationRoute!=null && navigationRoute.category!=null){
        route = this.route!;
        category = navigationRoute.category!;
        List<Pair<RoutePath?, RoutePath>> categoryHistory = [...history[category]!];
        categoryHistory.add(Pair(previousRoute, route));
        history[category] = categoryHistory;
      } else {
        route = this.route!;
        category = null;
        // history[category]!.add(route);
      }
    } else if (this.category!=null) {
      if (history[this.category]!.isEmpty){
        route = this.category!.routePath;
        List<Pair<RoutePath?, RoutePath>> categoryHistory = [];
        categoryHistory.add(Pair(state.navigationState.currentRoute, route));
        history[this.category!] = categoryHistory;
      } else {
        route = history[this.category]!.last.r;
      }
      category = this.category;
    }else{
      route = const RouteHome();
    }
    return state.copyWith.navigationState(
      currentRoute: route,
      navigationIcons: navigationIcons,
      navigationCategory: category,
      navigationHistory: history,
    );
  }


}

class RoutePop extends ReduxAction<AppState> {
  // final RoutePath? route;
  // final AppNavigationCategory? category;
  // final List<IconData>? navigationIcons;

  RoutePop();

  @override
  AppState? reduce() {
    if (state.navigationState.navigationCategory==null){
      return state;
    }
    AppNavigationCategory category = state.navigationState.navigationCategory!;
    Map<AppNavigationCategory, List<Pair<RoutePath?,RoutePath>>> history = {
      ...state.navigationState.navigationHistory
    };
    List<Pair<RoutePath?, RoutePath>> categoryHistory = [...history[category]!];
    Pair<RoutePath?, RoutePath> currentRoute = categoryHistory.last;
    if (currentRoute.l!=null){
      categoryHistory.removeLast();
      history[category] = categoryHistory;
      NavigationRoute navigationRoute =
        appRoutesMap[currentRoute.l.runtimeType]!;

      return state.copyWith.navigationState(
        currentRoute: currentRoute.l!,
        // navigationIcons: this.navigationIcons,
        navigationCategory: navigationRoute.category,
        navigationHistory: history,
      );
    }

    categoryHistory.removeLast();
    history[category] = categoryHistory;
    if (categoryHistory.isEmpty){
      List<Pair<RoutePath?, RoutePath>> homeHistory = [...history[AppNavigationCategory.home]!];
      if (homeHistory.isEmpty){
        return state.copyWith.navigationState(
          currentRoute: AppNavigationCategory.home.routePath,
          // navigationIcons: this.navigationIcons,
          navigationCategory: AppNavigationCategory.home,
          navigationHistory: history,
        );
      }
      Pair<RoutePath?, RoutePath> homeLastRoute = homeHistory.last;
      return state.copyWith.navigationState(
        currentRoute: homeLastRoute.r,
        // navigationIcons: this.navigationIcons,
        navigationCategory: AppNavigationCategory.home,
        navigationHistory: history,
      );
    }
    currentRoute = categoryHistory.last;
    // NavigationRoute navigationRoute =
    // appRoutesMap[currentRoute.l.runtimeType]!;

    return state.copyWith.navigationState(
      currentRoute: currentRoute.r,
      // navigationIcons: this.navigationIcons,
      navigationCategory: state.navigationState.navigationCategory,
      navigationHistory: history,
    );
    // RoutePath route;
    // AppNavigationCategory? category;
    // Map<AppNavigationCategory, List<RoutePath>> history = {
    //   ...state.navigationState.navigationHistory
    // };
    // if (this.route!=null){
    //   NavigationRoute? navigationRoute =
    //   appRoutesMap[this.route.runtimeType];
    //   if (navigationRoute!=null && navigationRoute.category!=null){
    //     route = this.route!;
    //     category = navigationRoute.category!;
    //     List<RoutePath> categoryHistory = [...history[category]!];
    //     categoryHistory.add(route);
    //     history[category] = categoryHistory;
    //   } else {
    //     route = this.route!;
    //     category = null;
    //     // history[category]!.add(route);
    //   }
    // } else if (this.category!=null) {
    //   if (history[this.category]!.isEmpty){
    //     route = this.category!.routePath;
    //   } else {
    //     route = history[this.category]!.last;
    //   }
    //   category = this.category;
    // }else{
    //   route = const RouteHome();
    // }

  }


}
