import 'package:flutter/material.dart';
import 'package:recipes_app/src/presentation/navigation/app_navigation_categories/app_nav_categories.dart';

import '../core/route_path.dart';

abstract class RouteAction {}

class RouteChanged extends RouteAction {
  final RoutePath? route;
  final AppNavigationCategory? category;
  final List<IconData>? navigationIcons;

  RouteChanged({this.route, this.category, this.navigationIcons,});
}
