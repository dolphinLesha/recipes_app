import 'package:async_redux/async_redux.dart';
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
      child: StoreConnector<AppState, ThemeState>(
          converter: (store) => store.state.themeState,
          distinct: true,
        builder: (context, state) {
          return PlatformApp.router(
            // theme: store.state.themeState.currentTheme ?? ThemeData(),
            routeInformationParser: AppRouteInformationParser(),
            routerDelegate: AppRouterDelegate(store),
            backButtonDispatcher: RootBackButtonDispatcher(),
            debugShowCheckedModeBanner: true,
            routeInformationProvider: PlatformRouteInformationProvider(
                initialRouteInformation: const RouteInformation(
                    location: '/welcome/')),
            material: (context, platform) => MaterialAppRouterData(theme: AppTheme.materialTheme),
            cupertino: (context, platform) => CupertinoAppRouterData(theme: state.currentThemeMode ? AppTheme.cupertinoTheme : AppTheme.cupertinoDarkTheme),
          );
        }
      ),
    );
  }
}
