import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:groceries/Assets/Themes/Colorthemes.dart';
import 'package:groceries/Assets/Themes/Fonts.dart';
import 'package:groceries/Pages/AuthScreens/SignUp.dart';
import 'package:groceries/Services/AuthServ/Auth.dart';
import 'package:groceries/Services/AuthServ/gAuth.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  String email = '';
  String pass = '';
  @override
  Widget build(BuildContext context) {
    final emailField = TextField(
      onChanged: (val){
        setState(() {
          email = val;
        });
      },
      style: style20,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Email",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final passwordField = TextField(
      onChanged: (val){
        setState(() {
          pass = val;
        });
      },
      obscureText: true,
      style: style20,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: greenl,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          authserv(email: email,pass: pass).signinep(email,pass);
        },
        child: Text("Login",
            textAlign: TextAlign.center,
            style: style20.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
    final gloginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: greenl,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          final provider = Provider.of<GSignIn>(context,listen: false);
          provider.gLogin();
        },
        child: Text("Google Login",
            textAlign: TextAlign.center,
            style: style20.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
        body: Center(
          child: SingleChildScrollView(

      child: SafeArea(
          child: Center(
            child: Container(
              color: Colors.white,
              child: Form(
                child: Padding(
                  padding: const EdgeInsets.all(36.0),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Stack(
                          children: <Widget>[
                            Text(
                              'Groceries',
                              style: TextStyle(
                                fontFamily: 'Visby Round CF',
                                fontSize: 36,
                                color: const Color(0xff000000),
                              ),
                              textAlign: TextAlign.left,
                            ),
                            // Adobe XD layer: 'Icon awesome-leaf' (shape)
                            Positioned(
                              left: 180,
                              child: SvgPicture.string(
                                '<svg viewBox="1689.0 591.4 17.3 15.4" ><path transform="translate(1688.98, 591.39)" d="M 16.4312801361084 0.2908136248588562 C 16.26283836364746 -0.08517226576805115 15.78157615661621 -0.1002117022871971 15.58004665374756 0.2547189593315125 C 14.64760303497314 1.875969886779785 12.97822570800781 2.886620044708252 11.0712251663208 2.886620044708252 L 8.664915084838867 2.886620044708252 C 5.476555824279785 2.886620044708252 2.889772891998291 5.473402500152588 2.889772891998291 8.661763191223145 C 2.889772891998291 8.872315406799316 2.913836002349854 9.073844909667969 2.934891223907471 9.278380393981934 C 4.853923320770264 7.903775215148926 7.624187469482422 6.736715316772461 11.55248641967773 6.736715316772461 C 11.81718063354492 6.736715316772461 12.03374767303467 6.953283786773682 12.03374767303467 7.217977046966553 C 12.03374767303467 7.48267126083374 11.81718063354492 7.699239730834961 11.55248641967773 7.699239730834961 C 3.990659713745117 7.699239730834961 0.7842519283294678 12.33439254760742 0.07439060509204865 14.07596111297607 C -0.1241299584507942 14.56624698638916 0.11048524081707 15.12571334838867 0.6007707118988037 15.32724094390869 C 1.094064354896545 15.53177833557129 1.653531312942505 15.29415416717529 1.858067750930786 14.80687713623047 C 1.903185963630676 14.6985912322998 2.486716270446777 13.36609745025635 4.02073860168457 12.08173084259033 C 4.995294094085693 13.40219211578369 6.848152160644531 14.66249752044678 9.28153133392334 14.40381813049316 C 14.00391387939453 14.06092166900635 17.3276309967041 9.82581615447998 17.3276309967041 4.640217781066895 C 17.3276309967041 3.130258798599243 17.00277900695801 1.566157460212708 16.4312801361084 0.2908133268356323 Z" fill="#207567" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                                allowDrawingOutsideViewBox: true,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 45.0),
                        emailField,
                        SizedBox(height: 25.0),
                        passwordField,
                        SizedBox(
                          height: 35.0,
                        ),
                        loginButon,
                        SizedBox(
                          height: 25.0,
                        ),
                        gloginButon,
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('If you dont have account now,',style: TextStyle(color: Colors.grey)),
                            TextButton(
                                onPressed: () {
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> SignUp()));
                                },
                                child: Text(
                                  'Sign Up Now!',
                                  style: TextStyle(color: Colors.grey),
                                ))
                          ],
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
      ),
    ),
        ));
  }
}
