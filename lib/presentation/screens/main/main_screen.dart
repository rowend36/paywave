import 'dart:math';

import 'package:ficonsax/ficonsax.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:paywave/presentation/widget/route_icon.dart';
import 'package:paywave/presentation/bloc/logic/auth.dart';
import 'package:paywave/presentation/bloc/logic/finances.dart';
import 'package:paywave/data/models/app_route.dart';
import 'package:paywave/data/models/user.dart';
import 'package:paywave/data/models/user_account.dart';
import 'package:paywave/presentation/screens/main/pages/card/card_page.dart';
import 'package:paywave/presentation/screens/main/pages/home/home_page.dart';
import 'package:paywave/presentation/screens/main/pages/notifications/notifications_page.dart';
import 'package:paywave/presentation/screens/main/pages/profile/profile_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

final currentRoute = CurrentRoute(homeRoute);

class _MainScreenState extends State<MainScreen> {
  static const routes = [
    homeRoute,
    cardRoute,
    profileRoute,
    notificationsRoute
  ];
  static final pages = routes.map((e) => e.page).toList(growable: false);
  bool isScrolling = false;
  late final PageController controller;
  _MainScreenState() {
    controller =
        PageController(initialPage: pages.indexOf(currentRoute.value.page));
    currentRoute.addListener(_updatePage);
  }

  @override
  dispose() {
    super.dispose();
    currentRoute.removeListener(_updatePage);
  }

  _updatePage() async {
    if (isScrolling) return;
    debugPrint("Updating to ${currentRoute.value.name}");
    try {
      isScrolling = true;
      await controller.animateToPage(
          max(0, pages.indexOf(currentRoute.value.page)),
          duration: const Duration(milliseconds: 600),
          curve: Curves.ease);
    } finally {
      isScrolling = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<CurrentRoute>(create: (_) => currentRoute),
          ChangeNotifierProvider<CurrentUser>(create: (_) => currentUser),
          ChangeNotifierProvider<UserAccount>(create: (_) => userAccount)
        ],
        child: Scaffold(
          body: PageView(
            controller: controller,
            onPageChanged: (page) {
              if (isScrolling) return;
              try {
                isScrolling = true;
                debugPrint("Changing route $page");
                currentRoute.value = routes[page];
              } finally {
                isScrolling = false;
              }
            },
            children: pages,
          ),
          bottomNavigationBar: const BottomAppBar(
            shape: CircularNotchedRectangle(),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: SizedBox(
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  RouteIcon(homeRoute),
                  RouteIcon(cardRoute),
                  SizedBox(width: 40), // The dummy child
                  RouteIcon(profileRoute),
                  RouteIcon(notificationsRoute),
                ],
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            onPressed: (() {}),
            tooltip: 'Increment',
            shape: const CircleBorder(),
            child: const Icon(IconsaxOutline.add, size: 36),
          ),
        ));
  }
}
