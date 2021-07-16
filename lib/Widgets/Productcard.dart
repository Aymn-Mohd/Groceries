import 'package:flutter/material.dart';
import 'package:groceries/Assets/Themes/Fonts.dart';
import 'package:groceries/Models/Cart.dart';
import 'package:provider/provider.dart';

class ProductCard extends StatelessWidget {
  const ProductCard(
      {Key? key,
      required this.name,
      required this.quantity,
      required this.price,
      required this.barcode})
      : super(key: key);

  final String barcode;
  final String name;
  final int quantity;
  final double price;
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Container(
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),color: Colors.white,),

      padding: EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [Text(name,style: style17b,)],
          ),
          Column(
            children: [Text("$quantity",style: style17b,)],
          ),
          Column(
            children: [Text("$price Dhs",style: style17b,)],
          ),
          Column(
            children: [
              IconButton(
                  onPressed: () {
                    cart.addItem(barcode, name, price,);
                  },
                  icon: Icon(Icons.add_circle_outline_outlined,size:35,))
            ],
          )
        ],
      ),
    );
  }
}
