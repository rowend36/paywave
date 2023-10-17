import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
// import 'package:sgpaypoint/presentation/routes.dart';
import 'package:paywave/presentation/theme/app_colors.dart';
import 'package:paywave/presentation/theme/app_theme.dart';
import 'package:paywave/presentation/theme/main_theme.dart';
import 'package:provider/provider.dart';
import 'package:paywave/data/state/account.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:paywave/presentation/screens/send_funds/send_details.dart';
import 'package:paywave/presentation/pages/send_funds.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AllTheme paywavetheme = AllTheme();
  @override
  Widget build(BuildContext context) {
    double screen_width = MediaQuery.of(context).size.width;
    double screen_height = MediaQuery.of(context).size.height;
    final account_details =
        Provider.of<AccountProvider>(context, listen: false).accountModel;

    return Scaffold(
        backgroundColor: AppColors.background,
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: 100),
            decoration: BoxDecoration(
                gradient: paywavetheme.gradientTheme,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            height: screen_height,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                width: screen_width,
                padding: EdgeInsets.only(top: 40, bottom: 40),
                // margin: EdgeInsets.symmetric(horizontal: 10.0),
                decoration: BoxDecoration(
                    // color: sgtheme.blackColor,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: AppColors
                          .darkOnPrimary, // Change the background color as needed
                      // backgroundColor: AppColors.darkPrimaryFixedDim,
                      radius: 30,
                      child: Text(
                        "M",
                        style: TextStyle(
                          color:
                              Colors.white, // Change the text color as needed
                          fontSize: 20, // Adjust the text size as needed
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Moses",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.darkOnPrimary),
                    ),
                    SizedBox(height: 20),
                    Text("benmos16@gmail.com",
                        style: TextStyle(
                            color: AppColors.darkOnPrimary,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 20),
                    Text(
                      "Account Number : ${account_details?.accountNumber ?? "no account number yet"}",
                      style: TextStyle(
                          color: AppColors.darkOnPrimary,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),

              Container(
                padding: EdgeInsets.all(20),
                child: Card(
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: null,
                        child: Container(
                            padding: EdgeInsets.symmetric(vertical: 15),
                            child: Text(
                              "Change Transactional Pin",
                              textAlign: TextAlign.start,
                            )),
                      ),
                      Divider(),
                      GestureDetector(
                        onTap: null,
                        child: Container(
                            padding: EdgeInsets.symmetric(vertical: 15),
                            child: Text("Change Password")),
                      ),
                      Divider(),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SendFunds()));
                        },
                        child: Container(
                            padding: EdgeInsets.symmetric(vertical: 15),
                            child: Text(
                              "Send Funds",
                              textAlign: TextAlign.start,
                            )),
                      ),
                    ],
                  ),
                ),
              ),

              // Wrap(
              //   spacing: 50,
              //   runSpacing: 0.8,
              //   children: [
              //     GestureDetector(
              //         onTap: null,
              //         child: Column(children: [
              //           Container(
              //               padding: EdgeInsets.all(10),
              //               decoration: BoxDecoration(
              //                   color: AppColors.darkOnPrimary,
              //                   borderRadius: BorderRadius.circular(10)),
              //               child: Icon(FontAwesomeIcons.bank)),
              //           SizedBox(
              //             height: 5,
              //           ),
              //           Text(
              //             "Deposit",
              //             style: TextStyle(
              //               color: Colors.white,
              //             ),
              //           )
              //         ])),
              //   ],
              // )
            ]),
          ),
        ));
  }
}
