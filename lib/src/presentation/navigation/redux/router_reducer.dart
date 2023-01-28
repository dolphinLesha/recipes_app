import 'package:recipes_app/src/presentation/modules/home/navigation/home_routes.dart';
import 'package:recipes_app/src/presentation/navigation/app_navigation_categories/app_nav_categories.dart';
import 'package:recipes_app/src/presentation/navigation/app_routes_config.dart';
import 'package:recipes_app/src/presentation/navigation/core/navigation_route.dart';
import 'package:recipes_app/src/presentation/navigation/core/route_path.dart';
import 'package:recipes_app/src/presentation/navigation/redux/router_actions.dart';
import 'package:redux/redux.dart';

import '../../../model/redux/state/app_state/app_state.dart';

class NavigationReducer {
  static final reducer = combineReducers<AppState>([
    TypedReducer<AppState, RouteChanged>(NavigationReducer._onRouteChanged),
  ]);

  static AppState _onRouteChanged(AppState state, RouteChanged action) {
    RoutePath route;
    AppNavigationCategory? category;
    Map<AppNavigationCategory, List<RoutePath>> history = {
      ...state.navigationState.navigationHistory
    };
    if (action.route!=null){
      NavigationRoute? navigationRoute =
      appRoutesMap[action.route.runtimeType];
      if (navigationRoute!=null && navigationRoute.category!=null){
        route = action.route!;
        category = navigationRoute.category!;
        List<RoutePath> categoryHistory = [...history[category]!];
        categoryHistory.add(route);
        history[category] = categoryHistory;
      } else {
        route = action.route!;
        category = null;
        // history[category]!.add(route);
      }
    } else if (action.category!=null) {
      if (history[action.category]!.isEmpty){
        route = action.category!.routePath;
      } else {
        route = history[action.category]!.last;
      }
      category = action.category;
    }else{
      route = const RouteHome();
    }
    return state.copyWith.navigationState(
      currentRoute: route,
      navigationIcons: action.navigationIcons,
      navigationCategory: category,
      navigationHistory: history,
    );
  }
}
