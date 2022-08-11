import 'package:recipes_app/src/presentation/navigation/redux/router_actions.dart';
import 'package:redux/redux.dart';

import '../../../model/redux/state/app_state/app_state.dart';

class NavigationReducer {
  static final reducer = combineReducers<AppState>([
    TypedReducer<AppState, RouteChanged>(NavigationReducer._onRouteChanged),
  ]);

  static AppState _onRouteChanged(AppState state, RouteChanged action) {
    return state.copyWith.navigationState(currentRoute: action.route, navigationIcons: action.navigationIcons);
  }
}
