import 'package:flutter/material.dart';
import 'package:groceries/Pages/AuthScreens/SignUp.dart';
import 'Login.dart';

class AuthMain extends StatefulWidget {
  const AuthMain({Key? key}) : super(key: key);

  @override
  _AuthMainState createState() => _AuthMainState();
}

class _AuthMainState extends State<AuthMain> {
  bool showSignIn = true;
  void toggleView() {
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return Login(
        toggleView: toggleView,
      );
    } else {
      return SignUp(
        toggleView: toggleView,
      );
    }
  }
}
