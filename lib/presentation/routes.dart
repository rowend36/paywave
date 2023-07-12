import 'package:flutter/material.dart';
import 'package:paywave/presentation/pages/splash.dart';
import 'package:paywave/presentation/pages/onboarding.dart';
import 'package:paywave/presentation/screens/onboarding/screen1.dart';
import 'package:paywave/presentation/screens/onboarding/screen2.dart';
import 'package:paywave/presentation/screens/onboarding/screen3.dart';
import 'package:paywave/presentation/pages/sign_up.dart';
import 'package:paywave/presentation/pages/sign_in.dart';
import 'package:paywave/presentation/pages/notifications.dart';
import 'package:paywave/presentation/pages/transaction.dart';
import 'package:paywave/presentation/screens/transaction/details.dart';
import 'package:paywave/presentation/pages/otp_verification.dart';
import 'package:paywave/presentation/pages/main.dart';
import 'package:paywave/presentation/pages/create_pin.dart';
import 'package:paywave/presentation/screens/incorrect_otp.dart';

class AppRoutes {
  static const String home = '/';
  static const String onboarding = '/onboarding';
  static const String onboarding_screen1 = '/onboarding/screen1';
  static const String onboarding_screen2 = '/onboarding/screen2';
  static const String onboarding_screen3 = '/onboarding/screen3';
  static const String signup = '/signup';
  static const String signin = '/signin';
  static const String notification = '/notification';
  static const String transaction = '/transaction';
  static const String transaction_details = '/transaction/details';
  static const String main = '/main';
  static const String otp = "/otp";
  static const String otp_invalid = '/otp/error';
  static const String pin = '/pin';
  static const String pin_success = '/success';

  static Route<dynamic> generateRoute(RouteSettings routes) {
    switch (routes.name) {
      case home:
        return MaterialPageRoute(builder: (_) => Splash());
      // case onboarding:
      //   return MaterialPageRoute(builder: (_) => onBoarding());
      case onboarding:
        return MaterialPageRoute(builder: (_) => InvalidOtp());
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
      case transaction:
        return MaterialPageRoute(builder: (_) => Transaction());
      case transaction_details:
        return MaterialPageRoute(builder: (_) => TransactionDetails());
      case main:
        return MaterialPageRoute(builder: (_) => OtpVerification());
      case main:
        return MaterialPageRoute(builder: (_) => MainScreen());
      case otp:
        return MaterialPageRoute(builder: (_) => OtpVerification());
      case pin:
        return MaterialPageRoute(builder: (_) => CreatePin());

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
