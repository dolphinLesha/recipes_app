import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:recipes_app/src/model/redux/state/navigation_state/navigation_state.dart';
import 'package:recipes_app/src/presentation/core/styles/app_colors.dart';
import 'package:recipes_app/src/presentation/core/styles/app_typography.dart';
import 'package:recipes_app/src/presentation/modules/home/home_screen.dart';
import 'package:recipes_app/src/presentation/modules/navigation_bar/navigation_bar.dart';
import 'package:recipes_app/src/presentation/navigation/app_navigation_categories/app_nav_categories.dart';
import 'package:recipes_app/src/presentation/navigation/unknown_route.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../../model/redux/state/app_state/app_state.dart';
import 'app_routes_config.dart';
import 'core/navigation_route.dart';

class RouterScreen extends StatelessWidget {
  const RouterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, NavigationState>(
      converter: (store) => store.state.navigationState,
      distinct: true,
      builder: (context, state) {
        Widget body;
        NavigationRoute? navigationRoute =
            appRoutesMap[state.currentRoute.runtimeType];

        if (navigationRoute != null) {
          body = navigationRoute.screen;
        } else {
          body = const HomeScreen();
        }
        if (state.navigationCategory != null) {
          return PlatformScaffold(
            appBar: PlatformAppBar(
              // backgroundColor: MainColors.green,
              title: PlatformText(
                state.navigationCategory!.appBarTitle,
                style: AT.h3,
              ),
              // leading: Icon(
              //   PlatformIcons(context).personAdd,
              // ),
            ),
            body: AppNavigationBar(
              child: body,
            ),
          );
        }
        return PlatformScaffold(
          body: body,
        );
      },
    );
  }
}
