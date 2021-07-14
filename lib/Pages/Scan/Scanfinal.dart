import 'package:bottom_drawer/bottom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:groceries/Assets/Themes/Colorthemes.dart';
import 'package:groceries/Assets/Themes/Fonts.dart';
import 'package:groceries/Pages/Home.dart';
import 'package:scan/scan.dart';

class ScanFinal extends StatefulWidget {
  const ScanFinal({Key? key}) : super(key: key);

  @override
  _ScanFinalState createState() => _ScanFinalState();
}

class _ScanFinalState extends State<ScanFinal> {
  /// create a bottom drawer controller to control the drawer.
  BottomDrawerController drawerController = BottomDrawerController();
  ScanController scancontroller = ScanController();
  String qrcode = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: greenm,
        leading: IconButton(
          onPressed: () {
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
      body: Center(
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 500,
                  width: 600,
                  child: ScanView(
                      controller: scancontroller,
                      scanAreaScale: .7,
                      scanLineColor: Colors.red,
                      onCapture: (data) {
                        print(qrcode);
                        setState(() {
                          qrcode = data;
                        });
                        print(qrcode);
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
                          drawerController.open();
                        },
                        icon: Icon(
                          Icons.shopping_cart,
                          color: white,
                        )),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
      drawer: bottomDrawer(context),
    );
  }

  Widget bottomDrawer(BuildContext context) {
    return BottomDrawer(
      header: Container(
        color: white,
      ),
      body: Container(),
      headerHeight: 60.0,
      drawerHeight: 180.0,
      color: white,
      controller: drawerController,
    );
  }
}
