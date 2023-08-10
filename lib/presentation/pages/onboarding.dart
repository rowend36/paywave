import 'package:flutter/material.dart';
import '../theme/main_theme.dart';
import "../routes.dart";

class onBoarding extends StatefulWidget {
  const onBoarding({Key? key}) : super(key: key);
  @override
  _onBoardingState createState() => _onBoardingState();
}

class _onBoardingState extends State<onBoarding> {
  final AllTheme paywavetheme = AllTheme();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Stack(
          children: [
            Positioned(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'public/images/logo.png',
                      fit: BoxFit.cover,
                    ),
                    Text(
                      "Welcome to Paywave",
                      style: TextStyle(
                        fontSize: 28,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w600,
                        color: paywavetheme.customColor,
                      ),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      "Enjoy seamless transactions with easy payment process",
                      style: TextStyle(
                        fontSize: 16,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        color: paywavetheme.normalColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
                left: 0,
                right: 0,
                bottom: 20,
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        //push to screen 1
                        Navigator.pushNamed(
                            context, AppRoutes.onboarding_screen1);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: paywavetheme.gradientTheme,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Center(
                            child: Text(
                              'Create Account',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 18.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.signin);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.fromBorderSide(
                            BorderSide(
                              color: paywavetheme.gradientTheme.colors.first,
                              width: 2.0,
                              style: BorderStyle.solid,
                            ),
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Center(
                            child: Text(
                              'Sign In',
                              style: TextStyle(
                                color: paywavetheme.customColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
