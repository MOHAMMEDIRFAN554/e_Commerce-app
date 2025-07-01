import 'package:e_app/consts/consts.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child:
          "Cart is Empty!...".text
              .fontFamily(semibold)
              .color(darkFontGrey)
              .makeCentered(),
    );
  }
}
