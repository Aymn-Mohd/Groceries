import 'package:flutter/material.dart';
import 'package:groceries/Assets/Themes/Colorthemes.dart';

class Newnote extends StatefulWidget {
  const Newnote({Key? key, }) : super(key: key);


  @override
  _NewnoteState createState() => _NewnoteState();
}

class _NewnoteState extends State<Newnote> {
  String title = '';
  String descrp = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: greenl,

      ),
      body: Form(
        child: Column(
          children: [
            Row(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Title',
                  ),
                  onChanged: (val){
                    setState(() {
                      title = val;
                    });
                  },
                )
              ],
            ),
            Row(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Title',
                  ),
                  onChanged: (val){
                    setState(() {
                      descrp = val;
                    });
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
