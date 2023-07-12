import 'package:flutter/material.dart';
import '../pages/otp_verification.dart';
import '../theme/main_theme.dart';

class InvalidOtp extends StatelessWidget {
  final AllTheme paywavetheme = AllTheme();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Widget
          Container(
            color: Colors.blue, // Set the background color
            child: Center(
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
            child: OtpVerification(),
          ),
          Positioned.fill(
            child: Container(
              color: Colors.transparent, // Set the overlay color to transparent
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'public/images/error_avatar.png',
                      width: 50,
                      height: 50,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Incorrect OTP"),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Please enter the correct OTP "),
                    SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xFF7C757E),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white, // Set the overlay color
                        ),
                        child: Text(
                          "OK",
                          textAlign: TextAlign.center,
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
