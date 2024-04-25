import 'package:allportfolio_advance_flutter/app_routes/app_routes.dart';
import 'package:allportfolio_advance_flutter/utilies/product_utiles.dart';
import 'package:flutter/material.dart';

Widget ProductCart({required String category, required BuildContext context}) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: [
        ...allProducts
            .map(
              (e) => (category == e['category'])
                  ? GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed(AppRoutes.detailpage, arguments: e);
                      },
                      child: Container(
                        height: 200,
                        width: 200,
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            image: DecorationImage(
                              image: NetworkImage(e['thumbnail']),
                              fit: BoxFit.cover,
                            )),
                      ),
                    )
                  : Container(),
            )
            .toList()
      ],
    ),
  );
}
