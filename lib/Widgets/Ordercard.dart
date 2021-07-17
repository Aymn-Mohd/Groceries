import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:groceries/Models/Orderlist.dart';
List<Orderlist> Orders = [
  Orderlist('Lulu', '20.2.21', 60),
  Orderlist('Lulu', '20.1.21', 50),
  Orderlist('Max', '20.3.21', 50),
  Orderlist('Carrefour', '18.2.21', 50),
  Orderlist('Max', '20.3.21', 50),
  Orderlist('Carrefour', '18.2.21', 50),
  Orderlist('Max', '20.3.21', 50),
  Orderlist('Carrefour', '18.2.21', 50)
];
Widget ordercard(context, index) {
  return Container(
    padding: EdgeInsets.all(7),
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
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Text(
              Orders[index].Storename,
              style: GoogleFonts.montserrat(
                  fontSize: 36, fontWeight: FontWeight.w500),
              softWrap: true,
            ),
            Row(
              children: [
                Text(
                  Orders[index].Date,
                  style: GoogleFonts.montserrat(
                      fontSize: 12, fontWeight: FontWeight.w500),
                  softWrap: true,
                )
              ],
            )
          ],
        ),
        Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Text(
                Orders[index].price.toString(),
                style: GoogleFonts.montserrat(
                    fontSize: 25, fontWeight: FontWeight.w500),
                softWrap: true,
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: IconButton(
                onPressed: () {
                  print('itworks');
                },
                icon: Icon(Icons.more_vert_rounded),
              ),
            )
          ],
        )
      ],
    ),
  );
}