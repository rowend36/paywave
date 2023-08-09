import 'package:flutter/material.dart';
import '../theme/main_theme.dart';
import './main.dart';
import '../bloc/svg/svg.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:paywave/presentation/routes.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final AllTheme paywavetheme = AllTheme();

  final accountNumberTextController = TextEditingController();
  final amountTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // // Overlay Widget
          // Positioned.fill(
          //   child: Opacity(
          //     opacity: 0.7,
          //     child: MainScreen(),
          //   ),
          // ),
          Positioned(
            right: 0,
            bottom: 0,
            left: 0,
            child: Container(
              // top: 50,
              // left: 10,
              // right: 10,
              // width: MediaQuery.of(context).size.width * 0.1,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
                gradient: paywavetheme.gradientTheme,
              ),
              child: Container(
                padding: EdgeInsets.all(20),
                height: MediaQuery.of(context).size.height * 0.85,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                  gradient: paywavetheme.gradientTheme,
                ),
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Transform.translate(
                        offset: Offset(0, -40),
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Column(children: [
                            CircleAvatar(
                                backgroundColor: paywavetheme.customColor),
                            SizedBox(height: 20),
                            Text(
                              "Wade Waren",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 20),
                            Text(
                              "Account Number - 27267466766",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 20),
                          ]),
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10),
                              GestureDetector(
                                onTap: () {},
                                child: Text(
                                  "Set Financial Goals",
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                              ),
                              SizedBox(height: 10),
                              Divider(thickness: 1),
                              SizedBox(height: 10),
                              GestureDetector(
                                  onTap: () {},
                                  child: Text("Change Transaction Pin",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600))),
                              SizedBox(height: 10),
                              Divider(thickness: 1),
                              SizedBox(height: 10),
                              GestureDetector(
                                  onTap: () {},
                                  child: Text("Change Log In Pin",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600)))
                            ],
                          ))
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
