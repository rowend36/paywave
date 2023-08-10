import 'package:flutter/material.dart';
import '../pages/create_pin.dart';
import '../theme/main_theme.dart';

class PinSuccess extends StatelessWidget {
  final AllTheme paywavetheme = AllTheme();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Widget
          Container(
            color: Colors.blue, // Set the background color
            child: const Center(
              child: Opacity(
                opacity: 0.7, // Set the desired opacity (0.0 to 1.0)
                child: Text(
                  'Background Widget',
                  style: TextStyle(color: Colors.white, fontSize: 24.0),
                ),
              ),
            ),
          ),
          // Overlay Widget
          Positioned.fill(
            child: Opacity(
              opacity: 0.7,
              child: CreatePin(),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.4,
            left: 50,
            right: 50,
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'public/images/successful_avatar.png',
                      width: 50,
                      height: 50,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      "Successful",
                      style: TextStyle(fontSize: 25),
                    ),
                    const SizedBox(
                      height: 13,
                    ),
                    const Text(
                      "You have successfully created a new transaction pin, Please do not share with any third party ",
                      style: TextStyle(),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                        decoration: BoxDecoration(
                          gradient: paywavetheme.gradientTheme,
                          border: Border.all(
                            color: paywavetheme.buttonInactiveColor,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white, // Set the overlay color
                        ),
                        child: const Text(
                          "Confirm",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
