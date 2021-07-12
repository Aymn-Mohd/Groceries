import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:groceries/Assets/Themes/Colorthemes.dart';
import 'package:groceries/Pages/Home.dart';

import '../Scan/ScanEnter.dart';

class ShopList extends StatefulWidget {
  const ShopList({Key? key}) : super(key: key);

  @override
  _ShopListState createState() => _ShopListState();
}

class _ShopListState extends State<ShopList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(child: Container(),),


      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.playlist_add),
        backgroundColor: greenm,
        onPressed: (){},
      ),
      bottomNavigationBar: ConvexAppBar(
        height: 60,
        style: TabStyle.fixedCircle,
        elevation: 0,
        gradient: maingradient,
        activeColor: Colors.white,
        items: [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.done_all_rounded, title: 'Orders'),
          TabItem(
              icon: Icon(
                Icons.shopping_cart_rounded,
                color: Colors.black,
                size: 35,
              )),
          TabItem(icon: Icons.list_alt, title: 'List'),
          TabItem(icon: Icons.person_outline_rounded, title: 'Account'),
        ],
        onTap: (int i) {
          print(i);
          if(i==0){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomePage()));
          }
          if (i==2){
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (_) => ScanEnter()
              ),
            );
          }
        },
      ),
    );
  }
}
