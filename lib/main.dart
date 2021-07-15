import 'package:flutter/material.dart';
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
  
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
    create: (context) => GSignIn(),

      child: MaterialApp(home: Sauth(),)
    );
  }
}
