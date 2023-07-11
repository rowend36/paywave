import 'package:flutter/material.dart';

class AppRoute {
  final String name;
  final IconData icon;
  final IconData iconActive;
  final Widget page;
  const AppRoute(
      {required this.name,
      required this.icon,
      required this.iconActive,
      required this.page});
}

typedef CurrentRoute = ValueNotifier<AppRoute>;
