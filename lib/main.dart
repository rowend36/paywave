import 'package:flutter/material.dart';
import 'package:paywave/presentation/routes.dart';
import 'package:paywave/presentation/theme/app_theme.dart';
import 'package:paywave/presentation/theme/main_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AllTheme paywavetheme = AllTheme();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'One Tap',
      initialRoute: AppRoutes.home, // Define the initial route
      onGenerateRoute: AppRoutes.generateRoute, // Set the route generator
      // // Add theme and other configurations as needed
      theme: appTheme,
    );
  }
}
