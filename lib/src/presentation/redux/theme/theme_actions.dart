import 'package:flutter/material.dart';

abstract class ThemeAction {}

class ThemeChanged extends ThemeAction {
  final bool themeMode;

  ThemeChanged({required this.themeMode});
}
