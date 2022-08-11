import 'package:flutter/material.dart';
import 'package:recipes_app/src/model/redux/state/navigation_state/navigation_state.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../../model/redux/state/app_state/app_state.dart';
import 'app_routes_config.dart';
import 'core/navigation_route.dart';

class RouterScreen extends StatelessWidget {
  const RouterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('rebuild');
    return Scaffold(
      body: StoreConnector<AppState, NavigationState>(
          converter: (store) => store.state.navigationState,
          distinct: true,
          builder: (context, state) {
            NavigationRoute? navigationRoute = appRoutesMap[
                state.currentRoute.runtimeType];

            if (navigationRoute != null) {
              return navigationRoute.screen;
            }
            return const Center(
              child: Text('not found'),
            );
          },
        ),
    );
  }
}
