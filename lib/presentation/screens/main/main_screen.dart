import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

import 'package:paywave/presentation/pages/home_profile.dart';
import 'package:paywave/presentation/pages/notifications.dart';
import 'package:ficonsax/ficonsax.dart';
import 'package:flutter/material.dart';
import 'package:paywave/data/models/transactions.dart';
import 'package:paywave/presentation/bloc/logic/transactions.dart';
import 'package:paywave/presentation/screens/main/widgets/payment_limit_set_dialog.dart';
import 'package:paywave/presentation/theme/app_colors.dart';
import 'package:paywave/presentation/theme/app_theme.dart';
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

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  // final AllTheme sgtheme = AllTheme();
  TabController? tabController;
  int selectedIndex = 0;

  onItemClicked(int index) {
    setState(() {
      selectedIndex = index;
      tabController!.index = selectedIndex;
    });
  }

  @override
  void initState() {
    super.initState();

    tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    // bool darkMode = isDarkMode(context);
    return Scaffold(
      body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          controller: tabController,
          children: [HomePage(), Card(), ProfilePage(), Notifications()]),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.card_membership_sharp), label: "Card"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          BottomNavigationBarItem(
              icon: Icon(Icons.notification_add), label: "Notification"),
        ],
        unselectedItemColor: AppColors.black,
        selectedItemColor: AppColors.darkOnPrimary,
        backgroundColor: AppColors.background,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: TextStyle(fontSize: 14),
        showUnselectedLabels: true,
        currentIndex: selectedIndex,
        onTap: onItemClicked,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          // _openCardLimit(context);
        }),
        tooltip: 'Increment',
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.lightOnPrimary,
        shape: const CircleBorder(),
        child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            // transform: Matrix4.rotationZ(dialogShown ? -pi / 4 : 0),
            transformAlignment: Alignment.center,
            child: const Icon(IconsaxOutline.add, size: 36)),
      ),
    );
  }
}
