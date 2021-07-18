import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:groceries/Assets/Themes/Colorthemes.dart';
import 'package:groceries/Assets/Themes/Fonts.dart';
import 'package:groceries/Models/Orderlist.dart';
import 'package:groceries/Pages/Scan/ScanEnter.dart';
import 'package:groceries/Widgets/Ordercard.dart';
import 'Account.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String name = '';
  String email = '';
  List<Orderlist> Orders = [];

  @override
  Widget build(BuildContext context) {
    Future logout() async {
      await FirebaseAuth.instance.signOut();
    }

    return Scaffold(
      body: SafeArea(
        child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                      child: Text(
                        "What's today's",
                        style: GoogleFonts.montserrat(
                            fontSize: 36, fontWeight: FontWeight.w500),
                        softWrap: true,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Stack(
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
                    ),
                  ],
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) => ScanEnter()));
                  },
                  child: Container(
                    height: 50,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      color: const Color(0xff4e9c81),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0x29000000),
                          offset: Offset(0, 3),
                          blurRadius: 6,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(children: [
                            Text(
                              'Start Shopping',
                              style: GoogleFonts.montserrat(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: white),
                              softWrap: true,
                            ),
                          ]),
                          Column(children: [
                            Icon(
                              Icons.arrow_forward,
                              color: white,
                              size: 30,
                            )
                          ]),
                        ],
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
                          child: Text(
                            "Your Orders",
                            style: GoogleFonts.montserrat(
                                fontSize: 36, fontWeight: FontWeight.w500),
                            softWrap: true,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'See More',
                            style: style17b,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    height: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14.0),
                      color: const Color(0xe3f2f2f2),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0x29000000),
                          offset: Offset(0, 3),
                          blurRadius: 6,
                        ),
                      ],
                    ),
                    child: Builder(
                      builder: (context){
                        if (Orders.length <= 0) {
                          return Text('You have No Orders',style: style17b,);
                        }else{
                          return ListView.separated(
                              shrinkWrap: true,
                              separatorBuilder: (context, index) => const SizedBox(
                                height: 8,
                              ),
                              itemCount: Orders.length,
                              itemBuilder: (context, index) {
                                if (Orders.length < 0) {
                                  return Text(
                                    'You have made no Orders',
                                    style:
                                    TextStyle(fontSize: 15, color: Colors.black),
                                  );
                                } else {
                                  return ordercard(context, index);
                                }
                              });
                        }
                      },
                    )
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            )),
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
          TabItem(icon: Icons.person_outline_rounded, title: 'Account'),
          TabItem(icon: Icons.logout, title: 'Logout'),
        ],
        onTap: (int i) {
          print(i);
          if (i == 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => ScanEnter()),
            );
          }
          if (i == 3) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => Account()),
            );
          }
          if (i == 4) {
            logout();
          }
        },
      ),
    );
  }
}
