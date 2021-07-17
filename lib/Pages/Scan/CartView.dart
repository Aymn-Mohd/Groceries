import 'package:flutter/material.dart';
import 'package:groceries/Assets/Themes/Colorthemes.dart';
import 'package:groceries/Models/Cart.dart';
import 'package:groceries/Widgets/CartCard.dart';
import 'package:provider/provider.dart';

class Cartview extends StatelessWidget {
  const Cartview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.shopping_cart,
              color: white,
            )),
      ),
      body: Container(
        padding: EdgeInsets.all(8),
        child: ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(
                  height: 8,
                ),
            itemCount: cart.items.length,
            itemBuilder: (context, index) {
              return CartCard(
                  cart.items.values.toList()[index].barcode,
                  cart.items.values.toList()[index].name,
                  cart.items.values.toList()[index].price,
                  cart.items.values.toList()[index].quantity);
            }),
      ),
    );
  }
}
