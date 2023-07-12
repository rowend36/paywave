import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import '../theme/main_theme.dart';
import '../routes.dart';
import '../bloc/svg/notification.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CreatePin extends StatefulWidget {
  @override
  _CreatePinState createState() => _CreatePinState();
}

class _CreatePinState extends State<CreatePin> {
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

  List<Widget> _buildChildren() {
    return [
      Form(
        key: _formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'public/images/logo.png',
              fit: BoxFit.cover,
              width: 150,
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              "Create Transaction Pin",
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
                    mainAxisAlignment: MainAxisAlignment.start,
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
                  SizedBox(height: 16.0),
                  GestureDetector(
                    onTap: isPinComplete() ? () {} : null,
                    child: Container(
                      padding: EdgeInsets.all(20),
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                          gradient: isPinComplete()
                              ? paywavetheme.gradientTheme
                              : null,
                          color: isPinComplete()
                              ? null
                              : paywavetheme.buttonInactiveColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        'Confirm',
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
          ],
        ),
      ),
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
                children: _buildChildren(),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

// class CreatePin extends StatefulWidget {
//   @override
//   _CreatePinState createState() => _CreatePinState();
// }

// class _CreatePinState extends State<CreatePin> {

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Pin Input'),
//       ),
//       body:
//     );
//   }
// }
