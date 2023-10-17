import 'package:flutter/material.dart';
import 'package:paywave/presentation/screens/main/widgets/floating_menu_dialog.dart';
import '../../theme/main_theme.dart';
import 'package:paywave/main.dart';
import '../../bloc/svg/svg.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:paywave/presentation/routes.dart';

class SendFundDetails extends StatefulWidget {
  final send_details;
  const SendFundDetails({this.send_details});

  @override
  _SendFundDetailsState createState() => _SendFundDetailsState();
}

class _SendFundDetailsState extends State<SendFundDetails> {
  final AllTheme paywavetheme = AllTheme();

  Map<String, dynamic>? receivedData;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Access the arguments when the widget is initialized or when it receives new arguments.
    setState(() {
      receivedData =
          ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    });

    print(ModalRoute.of(context)?.settings.arguments);
  }

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
              CircleAvatar(backgroundColor: paywavetheme.customColor),
              SizedBox(height: 30),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'You are sending ',
                      style: TextStyle(
                          color: Colors.black, // Highlight color for name
                          fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: '${widget.send_details?['amount']}',
                      style: TextStyle(
                          color: paywavetheme
                              .customColor, // Highlight color for amount
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    TextSpan(
                        text: ' to ',
                        style: TextStyle(
                          color: Colors.black, // Highlight color for name
                          fontWeight: FontWeight.bold,
                        )),
                    TextSpan(
                      text: 'Wade Warren',
                      style: TextStyle(
                          color: paywavetheme
                              .customColor, // Highlight color for name
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Text(
                "Account Number - ${widget.send_details?['accountNumber']}",
                style: TextStyle(color: paywavetheme.customColor),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: GestureDetector(
                      child: Container(
                        padding: EdgeInsets.all(20),
                        margin: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: paywavetheme.customColor,
                            ),
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          "No",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: paywavetheme.customColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  // SizedBox(width: 5),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                                context, AppRoutes.send_funds_enter_pin)
                            .then((_) {
                          finishWithResult(context, null);
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(20),
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: paywavetheme.customColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: Text("Yes",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ),
                ],
              )
            ]),
          ),
        )
      ],
    ));
  }
}
