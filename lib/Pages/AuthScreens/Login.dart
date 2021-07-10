import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:groceries/Assets/Colorthemes.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String email = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Text(
                      "Sign In",
                      style: GoogleFonts.montserrat(
                          fontSize: 45, fontWeight: FontWeight.w500),
                      softWrap: true,
                    ),
                  ),
                  Row(
                    children: [
                      Padding(padding: EdgeInsets.fromLTRB(0,15,0, 10),
                      child: SizedBox(
                        width: 80,
                        height: 10,
                        child: ColoredBox(
                          color: greenm,
                        ),
                      ),)

                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(

                            fillColor: Colors.grey,
                          ),
                          onChanged: (val){
                            setState(() {
                              email = val;
                            });
                          },
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(

                            fillColor: Colors.grey,
                          ),
                          onChanged: (val){
                            setState(() {
                              email = val;
                            });
                          },
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Center(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(0,15,0, 0),
                          child: MaterialButton(
                            color: greenl,
                            minWidth: 50,
                            child:Text('Sign In',style: TextStyle(color: Colors.white),),
                            onPressed: (){},
                          ),
                        ),
                      )
                    ],
                  ),

                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}
