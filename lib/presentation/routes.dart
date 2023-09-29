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
import 'package:paywave/presentation/screens/main/main_screen.dart';
import 'package:paywave/presentation/pages/create_pin.dart';
import 'package:paywave/presentation/screens/incorrect_otp.dart';
import 'package:paywave/presentation/screens/pin_success.dart';
import 'package:paywave/presentation/pages/send_funds.dart';
import 'package:paywave/presentation/pages/profile.dart';

import 'package:paywave/presentation/screens/send_funds/send_details.dart';
import 'package:paywave/presentation/screens/send_funds/enter_transaction_pin.dart';
import 'package:paywave/presentation/screens/send_funds/send_success.dart';

class AppRoutes {
  static const String home = '/';
  static const String onboarding = '/onboarding';
  static const String onboarding_screen1 = '/onboarding/screen1';
  static const String onboarding_screen2 = '/onboarding/screen2';
  static const String onboarding_screen3 = '/onboarding/screen3';
  static const String signup = '/signup';
  static const String signin = '/signin';
  static const String transaction = '/transaction';
  static const String transaction_details = '/transaction/details';
  static const String main = '/main';
  static const String otp = "/otp";
  static const String otp_invalid = '/otp/error';
  static const String pin = '/pin';
  static const String pin_success = '/pin/success';
  // static const String notification = '/notification';
  static const String send_funds = '/send/funds';
  // static const String profile = '/send/profile';
  static const String send_funds_details = '/send/funds/details';
  static const String send_funds_enter_pin = '/send/funds/details/enter_pin';
  static const String send_funds_success = '/send/funds/details/success';

  static Route<dynamic> generateRoute(RouteSettings routes) {
    switch (routes.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const Splash());
      case onboarding:
        return MaterialPageRoute(builder: (_) => const onBoarding());
      // case onboarding:
      //   return MaterialPageRoute(builder: (_) => InvalidOtp());
      case onboarding_screen1:
        return MaterialPageRoute(builder: (_) => const onBoardingScreenOne());
      case onboarding_screen2:
        return MaterialPageRoute(builder: (_) => const onBoardingScreenTwo());
      case onboarding_screen3:
        return MaterialPageRoute(builder: (_) => const onBoardingScreenThree());
      case signup:
        return MaterialPageRoute(builder: (_) => SignUp());
      case signin:
        return MaterialPageRoute(builder: (_) => SignIn());
      case transaction:
        return MaterialPageRoute(builder: (_) => Transaction());
      case transaction_details:
        return MaterialPageRoute(builder: (_) => TransactionDetails());
      case main:
        return MaterialPageRoute(builder: (_) => MainScreen());
      case otp:
        return MaterialPageRoute(builder: (_) => OtpVerification());
      case pin:
        return MaterialPageRoute(builder: (_) => CreatePin());
      case otp_invalid:
        return MaterialPageRoute(builder: (_) => InvalidOtp());
      case pin_success:
        return MaterialPageRoute(builder: (_) => PinSuccess());
      case send_funds:
        return MaterialPageRoute(builder: (_) => const SendFunds());
      case send_funds_details:
        return MaterialPageRoute(builder: (_) => SendFundDetails());
      case send_funds_enter_pin:
        return MaterialPageRoute(builder: (_) => EnterTransactionPin());
      case send_funds_success:
        return MaterialPageRoute(builder: (_) => SendSuccess());

      // case notification:
      //   return MaterialPageRoute(builder: (_) => const Notifications());
      // case profile:
      //   return MaterialPageRoute(builder: (_) => const ProfilePage());

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('Error: Route not found!'),
            ),
          ),
        );
    }
  }
}
