import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app/src/data/common/classes/pair.dart';
import 'package:recipes_app/src/model/bloc/navigation/actions.dart';
import 'package:recipes_app/src/model/bloc/navigation/state/navigation_state.dart';
import 'package:recipes_app/src/presentation/modules/authentication/navigation/auth_routes.dart';
import 'package:recipes_app/src/presentation/modules/home/navigation/home_routes.dart';
import 'package:recipes_app/src/presentation/navigation/app_navigation_categories/app_nav_categories.dart';
import 'package:recipes_app/src/presentation/navigation/app_page.dart';
import 'package:recipes_app/src/presentation/navigation/app_routes_config.dart';
import 'package:recipes_app/src/presentation/navigation/core/navigation_route.dart';
import 'package:recipes_app/src/presentation/navigation/core/route_path.dart';
import 'package:recipes_app/src/presentation/navigation/router_screen.dart';
export 'actions.dart';

class NavigationBloc extends Bloc<NavigationAction, NavigationState> {

  static final NavigationBloc _bloc = NavigationBloc._internal();

  NavigationBloc._internal() : super(NavigationState(bottomNavigationHistory: Map.fromIterables(
      AppNavigationCategory.values,
      List.generate(AppNavigationCategory.values.length,
              (index) => const [])))) {
    on<RoutePush>(_routePush);
    on<RoutePushReplace>(_routePushReplace);
    on<RoutePop>(_routePop);
  }

  factory NavigationBloc() {
    return _bloc;
  }

  void _routePush (
      RoutePush event, Emitter<NavigationState> emit) async {
    print('${'-'*10}event.route');
    print(event.route);
    print(event.category);
    RoutePath route;
    AppNavigationCategory? category;
    Map<AppNavigationCategory, List<Pair<RoutePath?,RoutePath>>> history = state.bottomNavigationHistory;
    List<Page> navigationStack = [...state.navigationStack];
    if (event.route!=null){
      NavigationRoute? navigationRoute =
      appRoutesMap[event.route.runtimeType];
      if (navigationRoute!=null && navigationRoute.category!=null){
        route = event.route!;
        category = navigationRoute.category!;
        List<Pair<RoutePath?, RoutePath>> categoryHistory = history[category]!;
        categoryHistory.add(Pair(event.previousRoute, route));
        history[category] = categoryHistory;
        if (navigationStack.isEmpty || state.navigationCategory==null){
          navigationStack.add(AppPage(key: ValueKey(route.runtimeType), child: const RouterScreen(), rootNavigation: true));
        }
      } else if (navigationRoute!=null && navigationRoute.category==null){
        route = event.route!;
        category = null;
        navigationStack.add(AppPage(child: navigationRoute.screen));
      }else{
        route = const RouteWelcome();
        category = null;
        NavigationRoute navigationRoute =
        appRoutesMap[route.runtimeType]!;
        navigationStack.add(AppPage(child: navigationRoute.screen));
      }
    } else if (event.category!=null) {
      if (history[event.category]!.isEmpty){
        route = event.category!.routePath;
        List<Pair<RoutePath?, RoutePath>> categoryHistory = [];
        categoryHistory.add(Pair(state.currentRoute, route));
        history[event.category!] = categoryHistory;
      } else {
        route = history[event.category]!.last.r;
      }
      category = event.category;
      if (navigationStack.isEmpty || state.navigationCategory==null){
        navigationStack.add(AppPage(key: ValueKey(route.runtimeType), child: const RouterScreen(), rootNavigation: true));
      }
    }else{
      route = const RouteWelcome();
      category = null;
      NavigationRoute navigationRoute =
      appRoutesMap[route.runtimeType]!;
      navigationStack= [AppPage(child: navigationRoute.screen)];
    }
    emit(state.copyWith(
      currentRoute: route,
      navigationCategory: category,
      bottomNavigationHistory: history,
      navigationStack: navigationStack,
    ));

  }

  void _routePushReplace (
      RoutePushReplace event, Emitter<NavigationState> emit) async {
    print('event.route ${event.route}');
    RoutePath route;
    AppNavigationCategory? category;
    Map<AppNavigationCategory, List<Pair<RoutePath?,RoutePath>>> history = state.bottomNavigationHistory;
    List<Page> navigationStack = state.navigationStack;
    if (event.route!=null){
      NavigationRoute? navigationRoute =
      appRoutesMap[event.route.runtimeType];
      if (navigationRoute!=null && navigationRoute.category!=null){
        route = event.route!;
        category = navigationRoute.category!;
        List<Pair<RoutePath?, RoutePath>> categoryHistory = history[category]!;
        categoryHistory.add(Pair(event.previousRoute, route));
        history[category] = categoryHistory;
        if (navigationStack.isEmpty || state.navigationCategory==null){
          navigationStack.add(const AppPage(child: RouterScreen(), rootNavigation: true));
        }
      } else if (navigationRoute!=null && navigationRoute.category==null){
        route = event.route!;
        category = null;
        navigationStack.add(AppPage(child: navigationRoute.screen));
      }else{
        route = const RouteWelcome();
        category = null;
        NavigationRoute navigationRoute =
        appRoutesMap[route.runtimeType]!;
        navigationStack.add(AppPage(child: navigationRoute.screen));
      }
    } else if (event.category!=null) {
      if (history[event.category]!.isEmpty){
        route = event.category!.routePath;
        List<Pair<RoutePath?, RoutePath>> categoryHistory = [];
        categoryHistory.add(Pair(state.currentRoute, route));
        history[event.category!] = categoryHistory;
      } else {
        route = history[event.category]!.last.r;
      }
      category = event.category;
      if (navigationStack.isEmpty || state.navigationCategory==null){
        navigationStack.add(const AppPage(child: RouterScreen(), rootNavigation: true));
      }
    }else{
      route = const RouteWelcome();
      category = null;
      NavigationRoute navigationRoute =
      appRoutesMap[route.runtimeType]!;
      navigationStack= [AppPage(child: navigationRoute.screen)];
    }
    emit(state.copyWith(
      currentRoute: route,
      navigationCategory: category,
      bottomNavigationHistory: history,
      navigationStack: navigationStack,
    ));

  }

  void _routePop (
      RoutePop event, Emitter<NavigationState> emit) async {
    if (state.navigationCategory==null){
      return;
    }
    AppNavigationCategory category = state.navigationCategory!;
    Map<AppNavigationCategory, List<Pair<RoutePath?,RoutePath>>> history = {
      ...state.bottomNavigationHistory
    };
    List<Pair<RoutePath?, RoutePath>> categoryHistory = [...history[category]!];
    Pair<RoutePath?, RoutePath> currentRoute = categoryHistory.last;
    if (currentRoute.l!=null){
      categoryHistory.removeLast();
      history[category] = categoryHistory;
      NavigationRoute navigationRoute =
      appRoutesMap[currentRoute.l.runtimeType]!;

      emit(state.copyWith(
        currentRoute: currentRoute.l!,
        navigationCategory: navigationRoute.category,
        bottomNavigationHistory: history,
      ));
      return;
    }

    categoryHistory.removeLast();
    history[category] = categoryHistory;
    if (categoryHistory.isEmpty){
      List<Pair<RoutePath?, RoutePath>> homeHistory = [...history[AppNavigationCategory.home]!];
      if (homeHistory.isEmpty){
        emit(state.copyWith(
          currentRoute: AppNavigationCategory.home.routePath,
          navigationCategory: AppNavigationCategory.home,
          bottomNavigationHistory: history,
        ));
        return;
      }
      Pair<RoutePath?, RoutePath> homeLastRoute = homeHistory.last;
      emit(state.copyWith(
        currentRoute: homeLastRoute.r,
        navigationCategory: AppNavigationCategory.home,
        bottomNavigationHistory: history,
      ));
      return;
    }
    currentRoute = categoryHistory.last;
    // NavigationRoute navigationRoute =
    // appRoutesMap[currentRoute.l.runtimeType]!;

    emit(state.copyWith(
      currentRoute: currentRoute.r,
      navigationCategory: state.navigationCategory,
      bottomNavigationHistory: history,
    ));
    return;

  }

}