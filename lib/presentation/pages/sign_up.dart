import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:paywave/presentation/bloc/logic/auth.dart';
import 'package:paywave/presentation/bloc/logic/requests.dart';
import '../theme/main_theme.dart';
import '../routes.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final AllTheme paywavetheme = AllTheme();
  bool _isPasswordVisible = false;

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

  void _submit() async {
    setState(() {
      error = null;
    });
    try {
      if (_formkey.currentState!.validate()) {
        final navigator = Navigator.of(context);
        await signUp(
          email: _emailTextController.text.trim(),
          password: _passwordTextController.text.trim(),
          name: nameTextEditingController.text.trim(),
          address: addressTextEditingController.text.trim(),
          phone: phoneTextEditingController.text.trim(),
        );
        navigator.pushReplacementNamed(AppRoutes.main);
      } else {
        setState(() {
          error = "Invalid values supplied";
        });
      }
      // Navigator.of(context).pop();
    } on ResponseError catch (e) {
      setState(() {
        error = e.message;
      });
    } catch (e) {
      print(e.toString());
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
              "Create New Account",
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
            Theme(
                data: ThemeData(
                    inputDecorationTheme: InputDecorationTheme(
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: paywavetheme.customColor),
                  ),
                )),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Full Name',
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
                    nameTextEditingController.text = text;
                  }),
                )),
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
                  if (text.length < 6) {
                    return "Password can not be less than 6";
                  }
                  if (text.length > 25) {
                    return 'Password can\'t be more than 25';
                  }
                },
                onChanged: (text) =>
                    setState(() => {_passwordTextController.text = text}),
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
                obscureText: !_isPasswordVisible,
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
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
                    return 'Confirm Password can\'t be empty';
                  }
                  if (text != _passwordTextController.text) {
                    return "Confirm Password do not match";
                  }
                  if (text.length < 6) {
                    return "Please enter a valid confirm password";
                  }
                  if (text.length > 25) {
                    return 'Confirm Password can\'t be more than 25';
                  }
                },
                onChanged: (text) =>
                    setState(() => {_confirmTextEditingController.text = text}),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Checkbox(
                  value: _isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked = value!;
                    });
                  },
                  activeColor: paywavetheme.customColor,
                ),
                const Text("Remember Password")
              ],
            ),
            const SizedBox(height: 16.0),
            GestureDetector(
              onTap: _submit,
              child: Container(
                decoration: BoxDecoration(
                  gradient: paywavetheme.gradientTheme,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Center(
                    child: Text(
                      'Create Account',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have an account ? "),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.signin);
                  },
                  child: Text(
                    "Sign In",
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
                        Image.asset(
                          'public/images/sign-up-google.png',
                          fit: BoxFit.cover,
                          // width: 30,
                        ),
                        Text(
                          ' Sign up with google',
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
                          ' Sign up with Paywave ID',
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
            child: Image.asset(
              "public/images/onboarding-ellipse.png",
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: MediaQuery.of(context).size.width * 0.3,
          right: MediaQuery.of(context).size.width * 0.3,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.main);
                },
                child: const Text(
                  "Swipe right to go back",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey),
                )),
          ),
        ),
      ]),
    );
  }
}
