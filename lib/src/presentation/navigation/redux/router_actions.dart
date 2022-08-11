import 'package:flutter/material.dart';

import '../core/route_path.dart';

abstract class RouteAction {}

class RouteChanged extends RouteAction {
  final RoutePath route;
  final List<IconData>? navigationIcons;

  RouteChanged({required this.route, this.navigationIcons});
}
