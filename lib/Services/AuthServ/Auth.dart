import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class authserv {

  Future signinep(email,pass) async{

    try {
      UserCredential signinep = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: pass);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }

}
  Future registerep(email,pass) async{

    try {
      UserCredential Reegisterep = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email ,
        password: pass,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }


}
