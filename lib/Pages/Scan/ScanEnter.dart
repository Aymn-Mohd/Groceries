import 'package:flutter/material.dart';
import 'package:groceries/Assets/Themes/Colorthemes.dart';
import 'package:groceries/Pages/Home.dart';
import 'package:scan/scan.dart';

class ScanEnter extends StatefulWidget {
  const ScanEnter({Key? key}) : super(key: key);

  @override
  _ScanEnterState createState() => _ScanEnterState();
}

class _ScanEnterState extends State<ScanEnter> {
  ScanController scancontroller = ScanController();
  String qrcode = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        actions: [
          IconButton(onPressed: (){scancontroller.toggleTorchMode();}, icon:Icon(Icons.flash_on,))
        ],
      ),
      body: Container(
        child: ScanView(
            controller: scancontroller,
            scanAreaScale: .7,
            scanLineColor: Colors.green.shade400,
            onCapture: (data) {
              print(qrcode);
              setState(() {
                qrcode = data;
              });
              print(qrcode);
            }),
      ),
    );
  }
}
