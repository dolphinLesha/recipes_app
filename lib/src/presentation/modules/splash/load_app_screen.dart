import 'package:flutter/material.dart';
import 'package:recipes_app/di.dart';
import 'package:recipes_app/src/presentation/common/layouts/bacground_screen.dart';
import 'package:recipes_app/src/presentation/core/styles/app_colors.dart';
import 'package:recipes_app/src/presentation/core/styles/app_typography.dart';
import 'package:recipes_app/src/presentation/modules/home/home_screen.dart';
import 'package:recipes_app/src/presentation/modules/home/navigation/home_routes.dart';
import 'package:recipes_app/src/presentation/navigation/redux/router_actions.dart';

class LoadAppSplashScreen extends StatefulWidget {
  const LoadAppSplashScreen({Key? key}) : super(key: key);

  @override
  State<LoadAppSplashScreen> createState() => _LoadAppSplashScreenState();
}

class _LoadAppSplashScreenState extends State<LoadAppSplashScreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 1)).then((value) => DI.store.dispatch(RouteChanged(route: const RouteHome())));
    return BackgroundScreen(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Flexible(
            flex: 2,
            child: Center(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.02),
                  borderRadius: BorderRadius.circular(125),
                ),
                child: SizedBox(
                  width: 250,
                  height: 250,
                  child: Center(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.02),
                        borderRadius: BorderRadius.circular(115),
                      ),
                      child: SizedBox(
                        width: 230,
                        height: 230,
                        child: Center(
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.05),
                              borderRadius: BorderRadius.circular(105),
                            ),
                            child: SizedBox(
                              width: 210,
                              height: 210,
                              child: Center(
                                child: FittedBox(
                                  fit: BoxFit.fitWidth,
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Text(
                                      'Your recipes',
                                      style: AT.body1.copyWith(color: AdditionalColors.white, fontSize: 42),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 80),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: LinearProgressIndicator(
                      // value: 0.2,
                      backgroundColor: Colors.white.withOpacity(0.1),
                      color: AdditionalColors.white,
                      minHeight: 10,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    'загрузка данных',
                    style: AT.caption.copyWith(color: Colors.white.withOpacity(0.5)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
