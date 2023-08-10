import 'package:flutter/material.dart';
import 'package:paywave/presentation/screens/main/widgets/floating_menu_dialog.dart';
import '../../theme/main_theme.dart';
import 'package:paywave/main.dart';
import '../../bloc/svg/svg.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:paywave/presentation/routes.dart';

class EnterTransactionPin extends StatefulWidget {
  @override
  _EnterTransactionPinState createState() => _EnterTransactionPinState();
}

class _EnterTransactionPinState extends State<EnterTransactionPin> {
  final AllTheme paywavetheme = AllTheme();

  List<String> pinValues = ['', '', '', ''];
  List<FocusNode> focusNodes = List.generate(4, (index) => FocusNode());

  void updatePinValue(int index, String value) {
    setState(() {
      pinValues[index] = value;
      if (value.isNotEmpty) {
        if (index < 3) {
          focusNodes[index + 1].requestFocus();
        }
      }
    });
  }

  bool isPinComplete() {
    for (String value in pinValues) {
      if (value.isEmpty) {
        return false;
      }
    }
    return true;
  }

  @override
  void dispose() {
    for (var node in focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  //declare a Global key
  final _formkey = GlobalKey<FormState>();

  final accountNumberTextController = TextEditingController();
  final amountTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screen_height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Stack(
      children: [
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            height: screen_height * 0.6,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(45),
                  topRight: Radius.circular(45),
                )),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.cancel),
                      color: Colors.black,
                      iconSize: 20,
                    )),
              ),
              SizedBox(height: 30),
              Text(
                "Enter Transaction Pin",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 28),
              ),
              SizedBox(
                height: 22,
              ),
              Container(
                padding: EdgeInsets.zero,
                margin: EdgeInsets.zero,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (int i = 0; i < 4; i++)
                          Container(
                            margin: EdgeInsets.only(right: 12.0),
                            width: MediaQuery.of(context).size.width * 0.19,
                            height: 70.0,
                            child: TextField(
                              focusNode: focusNodes[i],
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                // focusedBorder: OutlineInputBorder(
                                //   borderRadius: BorderRadius.circular(10),

                                //   borderSide: BorderSide(
                                //       color: Colors
                                //           .red), // Change focused border color here
                                // ),
                                // enabledBorder: OutlineInputBorder(
                                //   borderRadius: BorderRadius.circular(10),
                                //   borderSide: BorderSide(
                                //       color: Colors
                                //           .blue), // Change default border color here
                                // ),
                                // hintStyle: TextStyle(color: Colors.red),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        color: paywavetheme.customColor)),

                                counterText: '', // Remove character counter
                              ),
                              keyboardType: TextInputType.number,
                              maxLength: 1,
                              onChanged: (value) => updatePinValue(i, value),
                              style: TextStyle(fontSize: 20.0),
                            ),
                          ),
                      ],
                    ),
                    SizedBox(height: 40.0),
                    GestureDetector(
                      onTap: isPinComplete()
                          ? () {
                              Navigator.pushNamed(
                                      context, AppRoutes.send_funds_success)
                                  .then((_) {
                                finishWithResult(context, null);
                              });
                              ;
                            }
                          : null,
                      child: Container(
                        padding: EdgeInsets.all(20),
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                            color: isPinComplete()
                                ? paywavetheme.customColor
                                : paywavetheme.buttonInactiveColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          'Complete Transaction',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: isPinComplete()
                                  ? Colors.white
                                  : Colors.black87),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceAround,
              //   children: [
              //     Expanded(
              //       child: GestureDetector(
              //         child: Container(
              //           padding: EdgeInsets.all(20),
              //           margin: EdgeInsets.all(20),
              //           decoration: BoxDecoration(
              //               border: Border.all(
              //                 color: paywavetheme.customColor,
              //               ),
              //               borderRadius: BorderRadius.circular(10)),
              //           child: Text(
              //             "No",
              //             textAlign: TextAlign.center,
              //             style: TextStyle(
              //               color: paywavetheme.customColor,
              //             ),
              //           ),
              //         ),
              //       ),
              //     ),
              //     // SizedBox(width: 5),
              //     Expanded(
              //       child: GestureDetector(
              //         child: Container(
              //           padding: EdgeInsets.all(20),
              //           margin: EdgeInsets.all(10),
              //           decoration: BoxDecoration(
              //               color: paywavetheme.customColor,
              //               borderRadius: BorderRadius.circular(10)),
              //           child: Text("Yes",
              //               textAlign: TextAlign.center,
              //               style: TextStyle(color: Colors.white)),
              //         ),
              //       ),
              //     ),
              //   ],
              // )
            ]),
          ),
        )
      ],
    ));
  }
}
