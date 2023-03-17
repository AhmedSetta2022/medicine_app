import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Screens/CheckOut.dart';
import '../provider/cart.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    final CartPass = Provider.of<Cart>(context);
    return Row(children: [
      Stack(
        children: [
          Container(
            child: Text(
              "${CartPass.SelctedProduct.length}",
              style: TextStyle(
                  fontSize: 12,
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.bold),
            ),
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: Color.fromARGB(211, 164, 255, 193),
                shape: BoxShape.circle),
          ),
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, 'CheckOut');
              },
              icon: Icon(
                Icons.add_shopping_cart,
                size: 20,
              ))
        ],
      ),
      Padding(
        padding: EdgeInsets.only(right: 12),
        child: Text(
          "\$ ${CartPass.Price.round()}",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      )
    ]);
  }
}
