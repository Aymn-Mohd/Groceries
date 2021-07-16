import 'package:bottom_drawer/bottom_drawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:groceries/Assets/Themes/Colorthemes.dart';
import 'package:groceries/Assets/Themes/Fonts.dart';
import 'package:groceries/Models/Cart.dart';
import 'package:groceries/Pages/Home.dart';
import 'package:groceries/Pages/Scan/CartView.dart';
import 'package:groceries/Widgets/Productcard.dart';
import 'package:provider/provider.dart';
import 'package:scan/scan.dart';

class ScanFinal extends StatefulWidget {
  const ScanFinal({Key? key, required this.qrcode}) : super(key: key);
  final qrcode;
  @override
  _ScanFinalState createState() => _ScanFinalState(qrcode: qrcode);
}

class _ScanFinalState extends State<ScanFinal> {
  /// create a bottom drawer controller to control the drawer.
  BottomDrawerController drawerController = BottomDrawerController();
  ScanController scancontroller = ScanController();
  String qrcode;
  String barcode = '';
  String name = 'Start Shopping';
  int quantity = 0;
  double price = 0;
  _ScanFinalState({required this.qrcode});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    final CollectionReference<void> products =
    FirebaseFirestore.instance.collection(qrcode);

    queryproduct() async {
      return await products
          .doc(barcode)
          .get()
          .then((DocumentSnapshot documentSnapshot) {
        var name = documentSnapshot.get('name').toString();
        print(name);
        var price = documentSnapshot.get('price');
        print(price);
        var quantity = documentSnapshot.get('quantity');
        setState(() {
          this.name = name;
          this.price = price;
          this.quantity = quantity;
        });
      });
    }
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: greenm,
        leading: IconButton(
          onPressed: () {
            cart.cler();
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => HomePage()),
            );
          },
          icon: Icon(
            Icons.cancel,
            size: 30,
          ),
        ),
      ),
      body: Container(
        child: ListView(
          children: [
            Container(
              height: 500,
              width: 600,
              child: ScanView(
                  controller: scancontroller,
                  scanAreaScale: .7,
                  scanLineColor: Colors.red,
                  onCapture: (data) {
                    print(barcode);
                    setState(() {
                      barcode = data;
                    });
                    print(barcode);
                    queryproduct();
                  }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.dialpad,
                      color: white,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.list_alt_outlined,
                      color: white,
                    )),
                MaterialButton(
                  color: white,
                  onPressed: () {
                    scancontroller.resume();
                  },
                  child: Text(
                    'Resume',
                    style: style20,
                  ),
                ),
                IconButton(
                    onPressed: () {
                      scancontroller.toggleTorchMode();
                    },
                    icon: Icon(
                      Icons.flash_on,
                      color: white,
                    )),
                IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Cartview()),
                      );
                    },
                    icon: Icon(
                      Icons.shopping_cart,
                      color: white,
                    )),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Builder(builder: (context) {
                return ProductCard(
                    name: name, quantity: quantity, price: price, barcode: barcode,);
              }),
            ),
          ],
        ),
      ),

    );
  }

  Widget bottomDrawer(BuildContext context) {
    return BottomDrawer(
      header: Container(
        color: white,
      ),
      body: Container(),
      headerHeight: 50.0,
      drawerHeight: 180.0,
      color: white,
      controller: drawerController,
    );
  }
}
