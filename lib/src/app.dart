import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:recipes_app/di.dart';
import 'package:recipes_app/src/model/bloc/navigation/bloc.dart';
import 'package:recipes_app/src/model/bloc/theme/bloc.dart';

import 'package:recipes_app/src/model/bloc/theme/state/theme_state.dart';
import 'package:recipes_app/src/model/bloc/user/bloc.dart';
import 'package:recipes_app/src/presentation/core/styles/app_theme.dart';
import 'package:recipes_app/src/presentation/navigation/app_route_delegate.dart';
import 'package:recipes_app/src/presentation/navigation/app_route_information_parser.dart';
import 'package:recipes_app/src/presentation/navigation/app_routes_config.dart';
import 'package:recipes_app/src/presentation/navigation/core/navigation_route.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NavigationBloc>.value(
          value: DI.navigationBloc,
        ),
        BlocProvider<UserBloc>.value(
          value: DI.userBloc,
        ),
        BlocProvider<ThemeBloc>.value(
          value: DI.themeBloc,
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        bloc: DI.themeBloc,
        builder: (context, state) {
          String location = '/welcome/';
          NavigationRoute? navigationRoute =
          appRoutesMap[DI.navigationBloc.state.currentRoute.runtimeType];
          if (navigationRoute!=null){
            location = navigationRoute.location!;
          }
          return PlatformApp.router(
            // theme: store.state.themeState.currentTheme ?? ThemeData(),
            routeInformationParser: AppRouteInformationParser(),
            routerDelegate: AppRouterDelegate(),
            backButtonDispatcher: RootBackButtonDispatcher(),
            debugShowCheckedModeBanner: true,
            routeInformationProvider: PlatformRouteInformationProvider(
                initialRouteInformation: RouteInformation(
                    location: location)),
            material: (context, platform) =>
                MaterialAppRouterData(theme: AppTheme.materialTheme),
            cupertino: (context, platform) => CupertinoAppRouterData(
                theme: state.currentThemeMode
                    ? AppTheme.cupertinoTheme
                    : AppTheme.cupertinoDarkTheme),
          );
        }
      ),
    );
  }
}

