import 'package:flutter/material.dart';
import 'package:paywave/presentation/pages/splash.dart';
import 'package:paywave/presentation/pages/onboarding.dart';
import 'package:paywave/presentation/screens/onboarding/screen1.dart';
import 'package:paywave/presentation/screens/onboarding/screen2.dart';
import 'package:paywave/presentation/screens/onboarding/screen3.dart';
import 'package:paywave/presentation/pages/sign_up.dart';
import 'package:paywave/presentation/pages/sign_in.dart';
import 'package:paywave/presentation/pages/notifications.dart';

class AppRoutes {
  static const String home = '/';
  static const String onboarding = '/onboarding';
  static const String onboarding_screen1 = '/onboarding/screen1';
  static const String onboarding_screen2 = '/onboarding/screen2';
  static const String onboarding_screen3 = '/onboarding/screen3';
  static const String signup = '/signup';
  static const String signin = '/signin';
  static const String notification = '/notification';

  static Route<dynamic> generateRoute(RouteSettings routes) {
    switch (routes.name) {
      case home:
        return MaterialPageRoute(builder: (_) => Splash());
      case onboarding:
        return MaterialPageRoute(builder: (_) => onBoarding());
      case onboarding_screen1:
        return MaterialPageRoute(builder: (_) => onBoardingScreenOne());
      case onboarding_screen2:
        return MaterialPageRoute(builder: (_) => onBoardingScreenTwo());
      case onboarding_screen3:
        return MaterialPageRoute(builder: (_) => onBoardingScreenThree());
      case signup:
        return MaterialPageRoute(builder: (_) => SignUp());
      case signin:
        return MaterialPageRoute(builder: (_) => SignIn());
      case notification:
        return MaterialPageRoute(builder: (_) => Notifications());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('Error: Route not found!'),
            ),
          ),
        );
    }
  }
}
