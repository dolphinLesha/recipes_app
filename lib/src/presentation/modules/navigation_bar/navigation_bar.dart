import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:recipes_app/di.dart';
import 'package:recipes_app/src/model/redux/app/app_state/app_state.dart';
import 'package:recipes_app/src/model/redux/navigation/navigation_state/navigation_state.dart';
import 'package:recipes_app/src/presentation/core/styles/app_colors.dart';
import 'package:recipes_app/src/presentation/navigation/app_navigation_categories/app_nav_categories.dart';
import 'package:recipes_app/src/presentation/navigation/redux/router_actions.dart';

class AppNavigationBar extends StatelessWidget {
  final Widget child;

  const AppNavigationBar({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, NavigationState>(
        converter: (store) => store.state.navigationState,
        distinct: true,
        builder: (context, state) {
        return Column(
          children: [
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: child,
            ),
            Flexible(
              flex: 0,
              child: PlatformWidget(
                cupertino: (_, __) {
                  return Container(
                    height: 90,
                    decoration: const BoxDecoration(
                      color: AdditionalColors.white,
                      border: Border(
                        top: BorderSide(
                          width: 1,
                          color: AdditionalColors.background,
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          for (var category in AppNavigationCategory.values)
                            PlatformIconButton(
                              icon: Icon(
                                category.icon(context),
                                color: state.navigationCategory == category ? MainColors.darkGreen : AdditionalColors.grey,
                                size: 36,
                              ),
                              onPressed: () {
                                DI.store.dispatch(RouteChanged(category: category));
                              },
                            ),
                        ],
                      ),
                    ),
                  );
                },

              ),
            ),
          ],
        );
      }
    );
  }
}
