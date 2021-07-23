import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:groceries/Assets/Themes/Colorthemes.dart';
import 'package:groceries/Assets/Themes/Fonts.dart';
import 'package:groceries/Models/Cart.dart';
import 'package:groceries/Pages/Scan/CartView.dart';
import 'package:provider/provider.dart';

class CartDrawer extends StatefulWidget {
  const CartDrawer({Key? key}) : super(key: key);

  @override
  _CartDrawerState createState() => _CartDrawerState();
}

class _CartDrawerState extends State<CartDrawer> {

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    double sum = 0;
    cart.items.values.forEach((element) {
      setState(() {
        sum = element.totalprice + element.totalprice ;
      });
    });
    return Drawer(
      child: Container(

        width: 600,
        child: Column(
          children: [
            Expanded(
              child: Cartview(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
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
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Total Price: $sum',
                              style: style20,
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Center(
                              child: MaterialButton(
                                onPressed: () {  },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: greenm,
                                    borderRadius: BorderRadius.circular(12.0),),
                                  padding: EdgeInsets.all(8),


                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text('Pay Now',style: style17w,),
                                          Icon(Icons.arrow_forward,color: Colors.white,)
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
