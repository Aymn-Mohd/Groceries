import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:groceries/Pages/AuthScreens/AuthMain.dart';
import 'package:groceries/Pages/Home.dart';

class Sauth extends StatelessWidget {
  const Sauth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
       if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(child: CircularProgressIndicator(),);
      }
      else if (snapshot.hasData){
        return HomePage();
      }
      return AuthMain();
    });
  }
}
