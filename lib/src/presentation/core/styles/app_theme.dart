import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipes_app/src/presentation/core/styles/app_colors.dart';

class AppTheme {
  static final materialTheme = ThemeData(
    textSelectionTheme:
        const TextSelectionThemeData(cursorColor: MainColors.darkGreen),
  );

  static const cupertinoTheme = CupertinoThemeData(
    brightness: Brightness.light,
  );

  static const cupertinoDarkTheme = CupertinoThemeData(
    brightness: Brightness.dark,
  );
}
