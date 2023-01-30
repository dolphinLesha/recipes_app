import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:recipes_app/di.dart';
import 'package:recipes_app/src/model/redux/app/app_state/app_state.dart';
import 'package:recipes_app/src/model/redux/navigation/navigation_state/navigation_state.dart';
import 'package:recipes_app/src/presentation/core/styles/app_colors.dart';
import 'package:recipes_app/src/presentation/core/styles/app_typography.dart';
import 'package:recipes_app/src/presentation/modules/home/home_screen.dart';
import 'package:recipes_app/src/presentation/modules/navigation_bar/navigation_bar.dart';
import 'package:recipes_app/src/presentation/navigation/app_navigation_categories/app_nav_categories.dart';
import 'package:recipes_app/src/presentation/navigation/redux/router_actions.dart';
import 'package:recipes_app/src/presentation/navigation/unknown_route.dart';
// import 'package:redux/redux.dart';
// import 'package:flutter_redux/flutter_redux.dart';

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
        print(navigationRoute);
        if (navigationRoute != null) {
          body = navigationRoute.screen;
        } else {
          body = const HomeScreen();
        }
        if (state.navigationCategory != null) {
          String title = state.navigationCategory!.appBarTitle;
          if (navigationRoute?.title!=null ){
            title = navigationRoute!.title!;
          }
          bool hasReturn = navigationRoute?.hasReturnButton ?? false;
          return PlatformScaffold(
            iosContentPadding: true,
            appBar: PlatformAppBar(
              // backgroundColor: MainColors.green,
              title: PlatformText(
                title,
                style: AT.h3,
              ),
              leading: hasReturn ? PlatformIconButton(
                onPressed: () {
                  DI.store.dispatch(RoutePop());
                },
                icon: Icon(
                  PlatformIcons(context).leftChevron,
                  size: 20,
                ),
              ) : null,
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
