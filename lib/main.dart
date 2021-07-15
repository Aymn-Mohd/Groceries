import 'package:flutter/material.dart';
import 'package:groceries/Pages/AuthScreens/Login.dart';
import 'package:groceries/Pages/AuthScreens/SignUp.dart';
import 'package:groceries/Pages/Home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:groceries/Services/AuthServ/Streamauth.dart';
import 'package:groceries/Services/AuthServ/gAuth.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
    create: (context) => GSignIn(),

      child: MaterialApp(home: Sauth(),)
    );
  }
}
