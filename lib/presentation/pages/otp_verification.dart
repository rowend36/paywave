import 'package:flutter/material.dart';
import '../theme/main_theme.dart';
import '../routes.dart';
import '../bloc/svg/svg.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OtpVerification extends StatefulWidget {
  @override
  _OtpVerificationState createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
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
            const SizedBox(
              height: 50,
            ),
            const Text(
              "Otp Verification",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 28),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Please enter the Verification Pin we’ve sent to the email you provided",
              style: TextStyle(
                  fontWeight: FontWeight.w700, color: paywavetheme.normalColor),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromRGBO(103, 80, 164, 0.08),
              ),
              child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                SvgPicture.string(
                  NotificationSvg().info,
                  width: 20,
                  height: 20,
                ),
                const SizedBox(width: 5),
                const Text("Otp expires in"),
                const SizedBox(width: 5),
                const Text("45 seconds",
                    style: TextStyle(color: Color.fromRGBO(0, 77, 100, 1.0))),
              ]),
            ),
            const SizedBox(
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
                          margin: const EdgeInsets.only(right: 12.0),
                          width: MediaQuery.of(context).size.width * 0.19,
                          height: 70.0,
                          child: TextField(
                            focusNode: focusNodes[i],
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: paywavetheme.customColor)),
                              counterText: '', // Remove character counter
                            ),
                            keyboardType: TextInputType.number,
                            maxLength: 1,
                            onChanged: (value) => updatePinValue(i, value),
                            style: const TextStyle(fontSize: 20.0),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  GestureDetector(
                    onTap: isPinComplete()
                        ? () {
                            Navigator.pushNamed(context, AppRoutes.otp_invalid);
                          }
                        : null,
                    child: Container(
                      padding: const EdgeInsets.all(20),
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
                        'Verify OTP',
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

// class OtpVerification extends StatefulWidget {
//   @override
//   _OtpVerificationState createState() => _OtpVerificationState();
// }

// class _OtpVerificationState extends State<OtpVerification> {

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
