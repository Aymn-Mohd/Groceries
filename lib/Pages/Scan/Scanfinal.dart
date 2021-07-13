import 'package:flutter/material.dart';
import 'package:groceries/Assets/Themes/Colorthemes.dart';
import 'package:groceries/Assets/Themes/Fonts.dart';
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
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(onPressed: (){}, icon:Icon(Icons.dialpad)),
                  MaterialButton(onPressed: (){scancontroller.resume();},child: Text('Resume',style: style20,),),
                  IconButton(onPressed: (){scancontroller.toggleTorchMode();}, icon:Icon(Icons.flash_on,))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
