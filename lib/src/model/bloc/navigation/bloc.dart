import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app/src/data/common/classes/pair.dart';
import 'package:recipes_app/src/model/bloc/navigation/actions.dart';
import 'package:recipes_app/src/model/bloc/navigation/state/navigation_state.dart';
import 'package:recipes_app/src/presentation/modules/home/navigation/home_routes.dart';
import 'package:recipes_app/src/presentation/navigation/app_navigation_categories/app_nav_categories.dart';
import 'package:recipes_app/src/presentation/navigation/app_routes_config.dart';
import 'package:recipes_app/src/presentation/navigation/core/navigation_route.dart';
import 'package:recipes_app/src/presentation/navigation/core/route_path.dart';
export 'actions.dart';

class NavigationBloc extends Bloc<NavigationAction, NavigationState> {

  static final NavigationBloc _bloc = NavigationBloc._internal();

  NavigationBloc._internal() : super(NavigationState(navigationHistory: Map.fromIterables(
      AppNavigationCategory.values,
      List.generate(AppNavigationCategory.values.length,
              (index) => const [])))) {
    on<RouteChanged>(_routeChanged);
    on<RoutePop>(_routePop);
  }

  factory NavigationBloc() {
    return _bloc;
  }

  void _routeChanged (
      RouteChanged event, Emitter<NavigationState> emit) async {
    RoutePath route;
    AppNavigationCategory? category;
    Map<AppNavigationCategory, List<Pair<RoutePath?,RoutePath>>> history = {
      ...state.navigationHistory
    };
    if (event.route!=null){
      NavigationRoute? navigationRoute =
      appRoutesMap[event.route.runtimeType];
      if (navigationRoute!=null && navigationRoute.category!=null){
        route = event.route!;
        category = navigationRoute.category!;
        List<Pair<RoutePath?, RoutePath>> categoryHistory = [...history[category]!];
        categoryHistory.add(Pair(event.previousRoute, route));
        history[category] = categoryHistory;
      } else {
        route = event.route!;
        category = null;
        // history[category]!.add(route);
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
    }else{
      route = const RouteHome();
    }
    emit(state.copyWith(
      currentRoute: route,
      navigationCategory: category,
      navigationHistory: history,
    ));

  }

  void _routePop (
      RoutePop event, Emitter<NavigationState> emit) async {
    if (state.navigationCategory==null){
      return;
    }
    AppNavigationCategory category = state.navigationCategory!;
    Map<AppNavigationCategory, List<Pair<RoutePath?,RoutePath>>> history = {
      ...state.navigationHistory
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
        navigationHistory: history,
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
          navigationHistory: history,
        ));
        return;
      }
      Pair<RoutePath?, RoutePath> homeLastRoute = homeHistory.last;
      emit(state.copyWith(
        currentRoute: homeLastRoute.r,
        navigationCategory: AppNavigationCategory.home,
        navigationHistory: history,
      ));
      return;
    }
    currentRoute = categoryHistory.last;
    // NavigationRoute navigationRoute =
    // appRoutesMap[currentRoute.l.runtimeType]!;

    emit(state.copyWith(
      currentRoute: currentRoute.r,
      navigationCategory: state.navigationCategory,
      navigationHistory: history,
    ));
    return;

  }

}