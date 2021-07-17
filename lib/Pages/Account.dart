import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:groceries/Assets/Themes/Colorthemes.dart';
import 'package:groceries/Assets/Themes/Fonts.dart';
import 'package:groceries/Pages/Home.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  String name = '';
  String email = '';
  final uid = FirebaseAuth.instance.currentUser!.uid;

  bool mounted = false;
  @override
  Widget build(BuildContext context) {
    final CollectionReference<void> user =
        FirebaseFirestore.instance.collection('users');

    queryuser() async {
      return await user
          .doc(uid)
          .get()
          .then((DocumentSnapshot documentSnapshot) {
        var name = documentSnapshot.get('Name').toString();
        print(name);
        var email = documentSnapshot.get('Email');
        print(email);
        if (mounted == false) {
          setState(() {
            this.name = name;
            this.email = email;
            mounted = !mounted;
          });
        }
      });
    }

    queryuser();

    return Scaffold(
      backgroundColor: greenm,
      appBar: AppBar(
          foregroundColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: MaterialButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => HomePage()));
            },
            child: Icon(
              Icons.arrow_back_ios,
              size: 30,
              color: Colors.white,
            ),
          )),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10),
          color: greenm,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  'Account',
                  style: style36wB,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  padding: EdgeInsets.all(10),
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: const Color(0xffffffff),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0x29000000),
                        offset: Offset(0, 3),
                        blurRadius: 6,
                      ),
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "$name",
                                style: style20,
                                textAlign: TextAlign.left,
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "$email",
                                style: style12b,
                                textAlign: TextAlign.left,
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                  child: ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 25),
                    child: MaterialButton(
                      onPressed: () {},
                      child: Container(
                        padding: EdgeInsets.all(15),
                        height: 66.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          color: const Color(0xffffffff),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0x29000000),
                              offset: Offset(0, 3),
                              blurRadius: 6,
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Your Orders',
                              style: style20B,
                            ),
                            Icon(
                              Icons.done_all_rounded,
                              size: 36,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 25),
                    child: MaterialButton(
                      onPressed: () {},
                      child: Container(
                        padding: EdgeInsets.all(15),
                        height: 66.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          color: const Color(0xffffffff),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0x29000000),
                              offset: Offset(0, 3),
                              blurRadius: 6,
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Cards',
                              style: style20B,
                            ),
                            Icon(
                              Icons.credit_card_sharp,
                              size: 36,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 25),
                    child: MaterialButton(
                      onPressed: () {},
                      child: Container(
                        padding: EdgeInsets.all(15),
                        height: 66.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          color: const Color(0xffffffff),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0x29000000),
                              offset: Offset(0, 3),
                              blurRadius: 6,
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Security',
                              style: style20B,
                            ),
                            Icon(
                              Icons.shield,
                              size: 36,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 25),
                    child: MaterialButton(
                      onPressed: () {
                        showAboutDialog(
                          context: context,
                          applicationName: 'Groceries',
                          applicationVersion: '1.2.0',
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.all(15),
                        height: 66.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          color: const Color(0xffffffff),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0x29000000),
                              offset: Offset(0, 3),
                              blurRadius: 6,
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'About App',
                              style: style20B,
                            ),
                            Icon(
                              Icons.info_outline_rounded,
                              size: 36,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
