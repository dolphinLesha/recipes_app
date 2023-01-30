import 'package:async_redux/async_redux.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

// import 'package:flutter_redux/flutter_redux.dart';
import 'package:recipes_app/src/model/redux/app/app_state/app_state.dart';
import 'package:recipes_app/src/model/redux/theme/theme_state/theme_state.dart';
import 'package:recipes_app/src/model/redux/user/actions.dart';
import 'package:recipes_app/src/presentation/core/styles/app_theme.dart';
import 'package:recipes_app/src/presentation/navigation/app_route_delegate.dart';
import 'package:recipes_app/src/presentation/navigation/app_route_information_parser.dart';
import 'package:recipes_app/src/presentation/navigation/app_routes_config.dart';
import 'package:recipes_app/src/presentation/navigation/core/navigation_route.dart';
// import 'package:redux/redux.dart';


class App extends StatelessWidget {
  final Store<AppState> store;

  const App({
    Key? key,
    required this.store,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: StoreConnector<AppState, ViewModel>(
          converter: (store) => ViewModel.fromStore(store),
          distinct: true,
          builder: (context, state) {
            print('state.theme ${state.theme}');
            print('state.location ${state.location}');
            return PlatformApp.router(
              // theme: store.state.themeState.currentTheme ?? ThemeData(),
              routeInformationParser: AppRouteInformationParser(),
              routerDelegate: AppRouterDelegate(store),
              backButtonDispatcher: RootBackButtonDispatcher(),
              debugShowCheckedModeBanner: true,
              routeInformationProvider: PlatformRouteInformationProvider(
                  initialRouteInformation: RouteInformation(
                      location: state.location)),
              material: (context, platform) =>
                  MaterialAppRouterData(theme: AppTheme.materialTheme),
              cupertino: (context, platform) =>
                  CupertinoAppRouterData(theme: state.theme
                      ? AppTheme.cupertinoTheme
                      : AppTheme.cupertinoDarkTheme),
            );
          }
      ),
    );
  }
}

// class Factory extends VmFactory<AppState, ViewModel> {
//   @override
//   ViewModel fromStore() {
//     String location = '/';
//     NavigationRoute? navigationRoute =
//     appRoutesMap[state.navigationState.currentRoute.runtimeType];
//     print(navigationRoute?.location);
//     if (navigationRoute != null) {
//       location = navigationRoute.location!;
//     }
//     return ViewModel(
//       theme: state.themeState.currentThemeMode,
//       location: location,
//     );
//   }
//
// }

/// The view-model holds the part of the Store state the dumb-widget needs.
class ViewModel extends Equatable {
  final bool theme;
  final String location;

  const ViewModel({
    required this.theme,
    required this.location,
  }) : super();
  
  static ViewModel fromStore(Store store) {
    String location = '/';
    NavigationRoute? navigationRoute =
    appRoutesMap[store.state.navigationState.currentRoute.runtimeType];
    print(navigationRoute?.location);
    if (navigationRoute != null) {
      location = navigationRoute.location!;
    }
    return ViewModel(
      theme: store.state.themeState.currentThemeMode,
      location: location,
    );
  }

  @override
  List<Object?> get props => [
    theme,
    location,
  ];
}
