import 'package:flutter/material.dart';
import '../../theme/main_theme.dart';
import '../../bloc/svg/notification.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TransactionDetails extends StatefulWidget {
  @override
  _TransactionDetailsState createState() => _TransactionDetailsState();
}

class _TransactionDetailsState extends State<TransactionDetails> {
  final AllTheme paywavetheme = AllTheme();

  bool filter = false;

  List<Widget> _buildChildren() {
    return [
      SizedBox(
        height: 30,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back, weight: 20, size: 30)),
              SizedBox(width: 6),
              Text(
                "Transaction Details",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 34,
                    fontStyle: FontStyle.normal,
                    fontFamily: "Roboto"),
              )
            ],
          ),
        ],
      ),
      SizedBox(
        height: 26.0,
      ),
      Center(
        child: Card(
          child: Column(children: [
            Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(15),
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Color.fromRGBO(103, 80, 164, 0.16),
                    borderRadius: BorderRadius.circular(16.0)),
                child: Column(
                  children: [
                    Text(
                      "You sent",
                      style: TextStyle(
                          color: Color(0xFF006684),
                          fontSize: 24,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text("#24000",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 44,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w600)),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text("To Osewe",
                        style: TextStyle(
                            color: Color(0xFF006684),
                            fontSize: 24,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w500))
                  ],
                )),
            Container(
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.fromLTRB(10, 10, 10, 2),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Status",
                        style: TextStyle(
                            color: paywavetheme.normalColor,
                            fontSize: 24,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "Successful",
                        style: TextStyle(
                            color: paywavetheme.customColor,
                            fontSize: 24,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Transaction ID",
                        style: TextStyle(
                            color: paywavetheme.normalColor,
                            fontSize: 24,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "603- 555-0123",
                        style: TextStyle(
                            color: paywavetheme.customColor,
                            fontSize: 24,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.grey, // Set the color of the line
              thickness: 0.5, // Set the thickness of the line
              indent: 16, // Set the left indent of the line
              endIndent: 16, // Set the right indent of the line
            ),
            ////
            Container(
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Balance before transaction",
                        style: TextStyle(
                            color: paywavetheme.customColor,
                            fontSize: 14,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "Balance after transaction",
                        style: TextStyle(
                            color: paywavetheme.customColor,
                            fontSize: 14,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "#100000",
                        style: TextStyle(
                            color: paywavetheme.normalColor,
                            fontSize: 24,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "#80000",
                        style: TextStyle(
                            color: paywavetheme.normalColor,
                            fontSize: 24,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.grey, // Set the color of the line
              thickness: 0.5, // Set the thickness of the line
              indent: 16, // Set the left indent of the line
              endIndent: 16, // Set the right indent of the line
            ),
            Container(
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Date",
                        style: TextStyle(
                            color: paywavetheme.normalColor,
                            fontSize: 24,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "9/4/12",
                        style: TextStyle(
                            color: paywavetheme.normalColor,
                            fontSize: 24,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.grey, // Set the color of the line
              thickness: 0.5, // Set the thickness of the line
              indent: 16, // Set the left indent of the line
              endIndent: 16, // Set the right indent of the line
            ),
            SizedBox(
              height: 8,
            ),
            Divider(
              color: Colors.grey, // Set the color of the line
              thickness: 0.5, // Set the thickness of the line
              indent: 16, // Set the left indent of the line
              endIndent: 16, // Set the right indent of the line
            ),
            SizedBox(
              height: 14,
            ),

            Container(
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.fromLTRB(10, 10, 10, 20),
              decoration: BoxDecoration(
                  border: Border.all(style: BorderStyle.solid, width: 0.3),
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.document_scanner_outlined,
                    color: paywavetheme.customColor,
                  ),
                  Text(
                    "Print Receipt",
                    style: TextStyle(
                        color: paywavetheme.customColor,
                        fontSize: 24,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            )
          ]),
        ),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _buildChildren(),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
