import 'package:flutter/material.dart';
import 'package:paywave/presentation/routes.dart';
import '../../theme/main_theme.dart';

class onBoardingScreenThree extends StatefulWidget {
  const onBoardingScreenThree({Key? key}) : super(key: key);
  @override
  _onBoardingScreenThreeState createState() => _onBoardingScreenThreeState();
}

class _onBoardingScreenThreeState extends State<onBoardingScreenThree> {
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
              top: 40,
              left: 0,
              right: 0,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'public/images/logo.png',
                      fit: BoxFit.cover,
                      width: 150,
                    ),
                    const SizedBox(
                      height: 50.0,
                    ),
                    Image.asset(
                      'public/images/onboarding-ellipse.png',
                      fit: BoxFit.cover,
                      width: 300,
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    Text(
                      "Payment bills",
                      style: TextStyle(
                        fontSize: 28,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w600,
                        color: paywavetheme.customColor,
                      ),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    Text(
                      "Disable & Activate  your card at intervals whenever you want to make payment ",
                      style: TextStyle(
                        fontSize: 16,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        color: paywavetheme.normalColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
                top: 25,
                left: 0,
                right: 0,
                child: Image.asset(
                  'public/images/wallet-take-out-bank-card.png',
                )),
            Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(children: [
                      Dot(
                        color: paywavetheme.normalColor,
                      ),
                      const SizedBox(width: 8),
                      Dot(
                        color: paywavetheme.normalColor,
                      ),
                      const SizedBox(width: 8),
                      Dot(
                        color: paywavetheme.customColor,
                        width: 24,
                      ),
                    ]),
                    const SizedBox(
                      height: 8.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.signup);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: paywavetheme.gradientTheme,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Row(children: [
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 3.0,
                            ),
                            Text(
                              'Next',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ]),
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

class Dot extends StatelessWidget {
  final Color color;
  final double width;

  const Dot({Key? key, required this.color, this.width = 12}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 12,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: color,
      ),
    );
  }
}
