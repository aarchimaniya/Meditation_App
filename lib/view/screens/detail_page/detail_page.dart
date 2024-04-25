import 'package:allportfolio_advance_flutter/utilies/product_utiles.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    Map<String, dynamic> product =
        (ModalRoute.of(context)?.settings.arguments ?? allProducts[0])
            as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Page"),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/category/whitmarble.jpeg"),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          children: [
            //ThumbNailView
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  product['images'].length,
                  (index) => Container(
                    height: size.height * 0.3,
                    width: size.width * 0.9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.black12,
                      image: DecorationImage(
                        image: NetworkImage(product['images'][index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                    margin: const EdgeInsets.all(
                      10,
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(),
            //DetailsCard
            Container(
              height: size.height * 0.5,
              width: size.width,
              decoration: const BoxDecoration(
                color: Colors.black12,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    spreadRadius: 5,
                    offset: Offset(0, -2),
                  ),
                ],
                borderRadius: BorderRadius.vertical(
                  top: Radius.elliptical(30, 50),
                ),
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product['title'],
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    product['description'],
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          late SnackBar snackBar;
          if (cartItems.contains(product)) {
            cartItems.remove(product);
            snackBar = SnackBar(
              content: Text("${product['title']} removed from the CART !!"),
              backgroundColor: Colors.red,
              behavior: SnackBarBehavior.floating,
            );
          } else {
            cartItems.add(product);
            snackBar = SnackBar(
              content: Text("${product['title']} added to the CART !!"),
              backgroundColor: Colors.green,
              behavior: SnackBarBehavior.floating,
            );
          }

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        icon: const Icon(Icons.shopping_cart),
        label: const Text("Add to cart"),
      ),
    );
  }
}
