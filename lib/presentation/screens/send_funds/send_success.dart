import 'package:flutter/material.dart';
import '../../pages/create_pin.dart';
import '../../theme/main_theme.dart';
import 'package:paywave/presentation/routes.dart';

class SendSuccess extends StatelessWidget {
  final AllTheme paywavetheme = AllTheme();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Widget
          // Container(
          //   color: Colors.blue, // Set the background color
          //   child: Center(
          //     child: Opacity(
          //       opacity: 0.7, // Set the desired opacity (0.0 to 1.0)
          //       child: Text(
          //         'Background Widget',
          //         style: TextStyle(color: Colors.white, fontSize: 24.0),
          //       ),
          //     ),
          //   ),
          // ),
          // // Overlay Widget
          // Positioned.fill(
          //   child: Opacity(
          //     opacity: 0.7,
          //     child: CreatePin(),
          //   ),
          // ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.4,
            left: 50,
            right: 50,
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'public/images/successful_avatar.png',
                      width: 50,
                      height: 50,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Successful",
                      style: TextStyle(fontSize: 25),
                    ),
                    SizedBox(
                      height: 13,
                    ),
                    Text(
                      "You have successfully created a new transaction pin, Please do not share with any third party ",
                      style: TextStyle(),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.profile);
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                        decoration: BoxDecoration(
                          color: paywavetheme.customColor,
                          border: Border.all(
                            color: paywavetheme.buttonInactiveColor,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          "OK",
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
