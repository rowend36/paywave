import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:paywave/presentation/bloc/logic/auth.dart';
import 'package:paywave/presentation/bloc/logic/requests.dart';
import '../theme/main_theme.dart';
import '../routes.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:paywave/data/state/account.dart';
import 'package:paywave/data/state/user.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AllTheme paywavetheme = AllTheme();
  bool _isPasswordVisible = false;
  bool loadingApi = false;

  bool _isChecked = false; // State variable to track the checkbox state
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  final _confirmTextEditingController = TextEditingController();
  final nameTextEditingController = TextEditingController();
  final addressTextEditingController = TextEditingController();
  final phoneTextEditingController = TextEditingController();
  String? error;
  //declare a Global key
  final _formkey = GlobalKey<FormState>();

  void _submit(BuildContext context) async {
    setState(() {
      error = null;
    });
    try {
      if (_formkey.currentState!.validate()) {
        setState(() {
          loadingApi = true;
        });

        final navigator = Navigator.of(context);
        final account_details = await signIn(
          context,
          email: _emailTextController.text.trim(),
          password: _passwordTextController.text.trim(),
        );
        Provider.of<AccountProvider>(context, listen: false)
            .setAccountModel(account_details);
        navigator.pushReplacementNamed(AppRoutes.main);
      } else {}
      // Navigator.of(context).pop();
    } on ResponseError catch (e) {
      setState(() {
        error = e.message;
      });
    } catch (e) {
      setState(() {
        loadingApi = false;
      });
      if (e.toString().contains("Failed host lookup")) {
        Fluttertoast.showToast(msg: "No internet connection");
      }
    }
  }

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
              "Sign In",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            error == null
                ? const SizedBox.square()
                : Text(
                    error!,
                    style: const TextStyle(fontSize: 16, color: Colors.red),
                  ),
            const SizedBox(height: 16.0),
            Theme(
              data: ThemeData(
                inputDecorationTheme: InputDecorationTheme(
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: paywavetheme.customColor),
                  ),
                ),
              ),
              child: TextFormField(
                cursorColor: paywavetheme.customColor,
                decoration: InputDecoration(
                    labelText: 'Email',
                    border:
                        const OutlineInputBorder(), // Set the border to a rectangular shape
                    focusColor: paywavetheme.customColor
                    // prefixIcon: Icon(Icons.email_outlined),
                    ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return 'Email can\'t be empty';
                  }
                  if (EmailValidator.validate(text) == true) {
                    return null;
                  }
                  if (text.length < 2) {
                    return "Please enter a valid email";
                  }
                  if (text.length > 99) {
                    return 'Email can\t be more than 50';
                  }
                },
                onChanged: (text) => setState(() {
                  _emailTextController.text = text;
                }),
              ),
            ),
            const SizedBox(height: 16.0),
            Theme(
              data: ThemeData(
                  inputDecorationTheme: InputDecorationTheme(
                floatingLabelBehavior: FloatingLabelBehavior.always,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: paywavetheme.customColor),
                ),
              )),
              child: TextFormField(
                cursorColor: paywavetheme.customColor,
                obscureText: !_isPasswordVisible,
                decoration: InputDecoration(
                  labelText: 'Password',
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                  border:
                      const OutlineInputBorder(), // Set the border to a rectangular shape
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return 'Password can\'t be empty';
                  }
                  if (text.length < 2) {
                    return 'Please enter a valid password';
                  }
                  if (text.length > 49) {
                    return 'Password can\'t be more than 50';
                  }
                  // Check for uppercase characters
                  if (text == text.toLowerCase()) {
                    return 'Password must contain at least one uppercase character';
                  }
                  // Check for uppercase characters
                  if (text == text.toUpperCase()) {
                    return 'Password must contain at least one lowercase character';
                  }
                  // Check for special characters using a regular expression
                  final specialChars = RegExp(r'[!@#\$%^&*(),.?":{}|<>]');
                  if (!specialChars.hasMatch(text)) {
                    return 'Password must contain at least one special character';
                  }
                },
                onChanged: (text) =>
                    setState(() => {_passwordTextController.text = text}),
              ),
            ),
            const SizedBox(height: 16.0),
            const SizedBox(height: 16.0),
            GestureDetector(
              onTap: () {
                if (!loadingApi) {
                  _submit(context);
                } else
                  null;
              },
              child: Container(
                decoration: BoxDecoration(
                  gradient: paywavetheme.gradientTheme,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Center(
                    child: !loadingApi
                        ? Text(
                            'Sign In',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        : CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account ? "),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.signup);
                  },
                  child: Text(
                    "Create Account",
                    style: TextStyle(
                        color: paywavetheme.customColor,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            const SizedBox(height: 24.0),
            GestureDetector(
              onTap: () {
                // Navigator.pushNamed(
                //     context, AppRoutes.);
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: paywavetheme.normalColor),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Center(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                        Image.asset(
                          'public/images/sign-up-google.png',
                          fit: BoxFit.cover,
                          // width: 30,
                        ),
                        Text(
                          ' Sign In with google',
                          style: TextStyle(
                            color: paywavetheme.customColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ])),
                ),
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            GestureDetector(
              onTap: () {
                //push to screen 1
                // Navigator.pushNamed(
                //     context, AppRoutes.onboarding_screen1);
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: paywavetheme.normalColor),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Center(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                        Text(
                          ' Sign In with Paywave ID',
                          style: TextStyle(
                            color: paywavetheme.customColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ])),
                ),
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
        Positioned(
          bottom: -100,
          left: 0,
          right: -MediaQuery.of(context).size.width * 0.3,
          child: Align(
            alignment: Alignment.bottomRight,
            child: Image.asset("public/images/onboarding-ellipse.png"),
          ),
        ),
      ]),
    );
  }
}
