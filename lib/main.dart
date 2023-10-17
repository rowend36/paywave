import 'package:flutter/material.dart';
import 'package:paywave/presentation/routes.dart';
import 'package:paywave/presentation/theme/app_theme.dart';
import 'package:paywave/presentation/theme/main_theme.dart';
import 'package:paywave/presentation/pages/sign_up.dart';
import 'package:paywave/data/state/account.dart';
import 'package:paywave/data/state/user.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AllTheme paywavetheme = AllTheme();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AccountProvider()),
        ChangeNotifierProvider(create: (context) => UserProvider())
      ],
      child: MaterialApp(
        title: 'One Tap',
        initialRoute: AppRoutes.signup, // Define the initial route
        onGenerateRoute: AppRoutes.generateRoute, // Set the route generator
        // // Add theme and other configurations as needed
        theme: appTheme,
        // home: SignUp(),
      ),
    );
  }
}
