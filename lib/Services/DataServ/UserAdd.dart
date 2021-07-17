import 'package:cloud_firestore/cloud_firestore.dart';

class UserAdd {
  final uid;
  UserAdd({required this.uid});
  final CollectionReference user =
      FirebaseFirestore.instance.collection('users');

  Future<void> adduser(
    String fname,
    String lname,
    String email,
    String pass,
  ) async {
    return await user.doc(uid).set({
      'Name': fname + lname,
      'Email': email,
      'Password': pass,
      'User ID': uid,
    });
  }

  Future<void> adduserg(
    String name,
    String email,
  ) async {
    return await user.doc(uid).set({
      'Name': name,
      'Email': email,
      'User ID': uid,
    });
  }
}
