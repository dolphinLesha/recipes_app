import 'package:flutter/material.dart';

typedef PS = PlatformSpecific;

class PlatformSpecific {
  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < 768;
  }

  static bool isTabletVertical(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width < 1024 && width >= 768;
  }

  static bool isTablet(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width < 1440 && width >= 1024;
  }

  static bool isWide(BuildContext context) {
    return MediaQuery.of(context).size.width >= 1440;
  }
}