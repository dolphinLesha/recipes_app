import 'package:flutter/material.dart';

abstract class ThemeAction {}

class ThemeChanged extends ThemeAction {
  final ThemeData theme;

  ThemeChanged({required this.theme});
}
