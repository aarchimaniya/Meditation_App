import 'package:allportfolio_advance_flutter/componets/product_cart.dart';
import 'package:flutter/material.dart';

Widget CategoryView({required String category, required BuildContext context}) {
  Size size = MediaQuery.of(context).size;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        category,
        style: const TextStyle(
          fontSize: 25,
        ),
      ),
      ProductCart(category: category, context: context),
    ],
  );
}
