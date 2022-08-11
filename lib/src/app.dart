import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:recipes_app/src/presentation/navigation/app_route_delegate.dart';
import 'package:recipes_app/src/presentation/navigation/app_route_information_parser.dart';
import 'package:redux/redux.dart';

import 'model/redux/state/app_state/app_state.dart';

class App extends StatelessWidget {
  final Store<AppState> store;

  const App({
    Key? key,
    required this.store,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(store.state.themeState.currentTheme);
    return StoreProvider(
      store: store,
      child: MaterialApp.router(
        theme: store.state.themeState.currentTheme ?? ThemeData(),
        routeInformationParser: AppRouteInformationParser(),
        routerDelegate: AppRouterDelegate(store),
        backButtonDispatcher: RootBackButtonDispatcher(),
        debugShowCheckedModeBanner: true,
      ),
    );
  }
}
