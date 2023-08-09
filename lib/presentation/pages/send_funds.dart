import 'package:flutter/material.dart';
import '../theme/main_theme.dart';
import './main.dart';
import '../bloc/svg/svg.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:paywave/presentation/routes.dart';

class SendFund extends StatefulWidget {
  @override
  _SendFundState createState() => _SendFundState();
}

class _SendFundState extends State<SendFund> {
  final AllTheme paywavetheme = AllTheme();

  final accountNumberTextController = TextEditingController();
  final amountTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      backgroundColor: Colors.transparent,
      child: Stack(
        children: [
          // // Overlay Widget
          // Positioned.fill(
          //   child: Opacity(
          //     opacity: 0.7,
          //     child: MainScreen(),
          //   ),
          // ),
          Container(
            // top: 50,
            // left: 10,
            // right: 10,
            // width: MediaQuery.of(context).size.width * 0.1,
            child: Container(
              padding: EdgeInsets.all(20),
              height: MediaQuery.of(context).size.height * 0.85,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Padding(
                padding: EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          // child: Text(
                          //   "    x",
                          //   style: TextStyle(
                          //       color: paywavetheme.customColor,
                          //       fontSize: 35,
                          //       fontWeight: FontWeight.w400),
                          // ),
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.cancel),
                            color: Colors.black,
                            iconSize: 20,
                          )),
                    ),
                    Text(
                      "Send Funds",
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Theme(
                        data: ThemeData(
                            inputDecorationTheme: InputDecorationTheme(
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: paywavetheme.customColor),
                          ),
                        )),
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'UserID/Account Number',
                            hintText: "12524252452",
                            border: OutlineInputBorder(),

                            // prefixIcon: Icon(Icons.person),
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return 'Name can\'t be empty';
                            }
                            if (text.length < 2) {
                              return "Please enter a valid name";
                            }
                            if (text.length > 49) {
                              return 'Name can\t be more than 50';
                            }
                          },
                          onChanged: (text) => setState(() {
                            accountNumberTextController.text = text;
                          }),
                        )),
                    SizedBox(height: 20),
                    Theme(
                        data: ThemeData(
                            inputDecorationTheme: InputDecorationTheme(
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: paywavetheme.customColor),
                          ),
                        )),
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Amount',
                            hintText: '1200',
                            border: OutlineInputBorder(),
                            suffixIcon: SvgPicture.string(
                              NotificationSvg().coins,
                              width: 5.0,
                              height: 5.0,
                            ),
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return 'Name can\'t be empty';
                            }
                            if (text.length < 2) {
                              return "Please enter a valid name";
                            }
                            if (text.length > 49) {
                              return 'Name can\t be more than 50';
                            }
                          },
                          onChanged: (text) => setState(() {
                            amountTextController.text = text;
                          }),
                        )),
                    SizedBox(height: 50),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                            context, AppRoutes.send_funds_details);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: accountNumberTextController
                                              .text.isNotEmpty &&
                                          amountTextController.text.isNotEmpty
                                      ? paywavetheme.customColor
                                      : paywavetheme.buttonInactiveColor),
                              child: Text(
                                "Send",
                                style: TextStyle(
                                    color: accountNumberTextController
                                                .text.isNotEmpty &&
                                            amountTextController.text.isNotEmpty
                                        ? Colors.white
                                        : Colors.grey[500]),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
