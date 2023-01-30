import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:recipes_app/src/model/redux/app/app_state/app_state.dart';

abstract class ThemeAction {}

class ThemeChanged extends ReduxAction<AppState> {
  final bool themeMode;

  ThemeChanged({required this.themeMode});

  @override
  AppState? reduce() {
    return state.copyWith.themeState(currentThemeMode: themeMode);
  }
}
