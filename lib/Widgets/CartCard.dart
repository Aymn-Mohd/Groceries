import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:groceries/Assets/Themes/Fonts.dart';
import 'package:groceries/Models/Cart.dart';
import 'package:provider/provider.dart';

class CartCard extends StatelessWidget {
  String barcode;
  String name;
  double price;
  int quantity;
  double totalprice;

  CartCard(this.barcode, this.name, this.price, this.quantity,this.totalprice, );

  @override
  Widget build(BuildContext context) {
    final sum = Provider.of<totalcost>(context);

    return Dismissible(
      key: ValueKey(barcode),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red,

      ),
      onDismissed: (direction){
        Provider.of<Cart>(context, listen: false).removeitem(barcode);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: Colors.white,
        ),
        height: 80,
        padding: EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  name,
                  style: style17b,
                )
              ],
            ),
            Column(
              children: [
                Builder(builder: (context) {
                  if (quantity == 1) {
                    return quantitycounter(context);
                  } else {
                    return quantitycounter1(context);
                  }
                })
              ],
            ),
            Column(
              children: [
                Text(
                  "Price: $totalprice Dhs",
                  style: style12b,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget quantitycounter1(context) {
    final cart = Provider.of<Cart>(context,listen: false);
    final sum = Provider.of<totalcost>(context);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32.0),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () {
                    cart.removesingitem(
                      barcode,
                    );

                  },
                  icon: Icon(FontAwesomeIcons.minusCircle, size: 22))
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text("$quantity")],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                  onPressed: () {
                    cart.addItem(barcode, name, price);

                  },
                  icon: Icon(Icons.add_circle_outline_outlined, size: 22))
            ],
          )
        ],
      ),
    );
  }

  Widget quantitycounter(context) {
    final cart = Provider.of<Cart>(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32.0),
        color: Colors.white,
      ),
      child: Row(
        children: [
          
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text("$quantity")],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                  onPressed: () {
                    cart.addItem(barcode, name, price);
                  },
                  icon: Icon(Icons.add_circle_outline_outlined, size: 22))
            ],
          )
        ],
      ),
    );
  }
}
