import 'package:flutter/material.dart';
import 'package:recipes_app/di.dart';
import 'package:recipes_app/src/data/common/classes/pair.dart';
import 'package:recipes_app/src/presentation/common/inputs/date_range_picker.dart';
import 'package:recipes_app/src/presentation/core/styles/app_typography.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: DI.store.state.themeState.currentTheme?.canvasColor,
      ),
      child: const Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(
              'Welcome to Flutter Sandbox',
              style: AT.h1,
            ),
          ),
        )
      ),
    );
  }
}
