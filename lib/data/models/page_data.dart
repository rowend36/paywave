import 'package:flutter/material.dart';

class PageData {
  final String name;
  final IconData icon;
  final IconData iconActive;
  final Widget page;
  const PageData(
      {required this.name,
      required this.icon,
      required this.iconActive,
      required this.page});
}

typedef CurrentPage = ValueNotifier<PageData>;
