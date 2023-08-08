import 'dart:async';
import 'dart:math';

import 'package:ficonsax/ficonsax.dart';
import 'package:flutter/material.dart';
import 'package:paywave/data/models/transactions.dart';
import 'package:paywave/presentation/bloc/logic/transactions.dart';
import 'package:paywave/presentation/screens/main/widgets/payment_limit_set_dialog.dart';
import 'package:paywave/presentation/theme/app_colors.dart';
import 'package:provider/provider.dart';
import 'package:paywave/presentation/widget/route_icon.dart';
import 'package:paywave/presentation/bloc/logic/auth.dart';
import 'package:paywave/presentation/bloc/logic/finances.dart';
import 'package:paywave/data/models/app_route.dart';
import 'package:paywave/data/models/user.dart';
import 'package:paywave/data/models/user_account.dart';

import 'pages/card/card_page.dart';
import 'pages/home/home_page.dart';
import 'pages/notifications/notifications_page.dart';
import 'pages/profile/profile_page.dart';
import 'widgets/floating_menu_dialog.dart';
import 'widgets/number_of_payments_dialog.dart';
import 'widgets/choose_limit_dialog.dart';
import 'widgets/one_time_payment_dialog.dart';
import 'widgets/time_limit_dialog.dart';

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
  bool dialogShown = false;
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

  _oneTimePayment() {
    /**TODO One time payment */
    _openDialog(const OneTimePaymentDialog());
  }

  Future _openDialog(Widget dialog, {dismissible = true}) {
    return showDialog<DialogResult>(
        context: context,
        barrierDismissible: dismissible,
        builder: (BuildContext context) {
          return dialog;
        }).then(_handleResult);
  }

  Future? _handleResult(DialogResult? result) {
    switch (result) {
      case DialogResult.oneTimePayment:
        return _oneTimePayment();
      case DialogResult.paymentLimit:
        return _openDialog(const ChooseLimitDialog());
      case DialogResult.numberOfTransactions:
        return _openDialog(const NumberOfPaymentsDialog(), dismissible: false);
      case DialogResult.done:
        return _openDialog(const PaymentLimitSetDialog(), dismissible: false);
      default:
        return null;
    }
  }

  _openCardLimit(BuildContext context) {
    if (dialogShown) return;
    setState(() {
      dialogShown = true;
      Future.delayed(const Duration(milliseconds: 280)).then((_) {
        _openDialog(const FloatingMenuDialog()).whenComplete(() => setState(() {
              dialogShown = false;
            }));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<CurrentRoute>(create: (_) => currentRoute),
          ChangeNotifierProvider<CurrentUser>(create: (_) => currentUser),
          ChangeNotifierProvider<UserAccount>(create: (_) => userAccount),
          ChangeNotifierProvider<TransactionList>(
              create: (_) => transactionList),
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
            onPressed: (() {
              _openCardLimit(context);
            }),
            tooltip: 'Increment',
            backgroundColor: AppColors.primary,
            foregroundColor: AppColors.lightOnPrimary,
            shape: const CircleBorder(),
            child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                transform: Matrix4.rotationZ(dialogShown ? -pi / 4 : 0),
                transformAlignment: Alignment.center,
                child: const Icon(IconsaxOutline.add, size: 36)),
          ),
        ));
  }
}
