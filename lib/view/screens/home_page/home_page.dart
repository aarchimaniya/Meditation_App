import 'package:allportfolio_advance_flutter/app_routes/app_routes.dart';
import 'package:allportfolio_advance_flutter/componets/category_view.dart';
import 'package:allportfolio_advance_flutter/utilies/product_utiles.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

final List<String> imgList = [
  "lib/assets/images/category/image1.jpg",
  "lib/assets/images/category/image2.jpg",
  "lib/assets/images/category/image3.jpg",
  "lib/assets/images/category/image4.jpg",
  "lib/assets/images/category/image5.jpg",
];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Home Page",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 25,
          ),
        ),
        // backgroundColor: const Color(0xFF5F6F52),
        actions: [
          const Icon(
            Icons.search_rounded,
            color: Colors.white,
          ),
          const SizedBox(
            width: 10,
          ),
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.detailpage);
              },
              icon: const Icon(
                Icons.self_improvement,
                color: Colors.white,
              ))
        ],
      ),
      body: Stack(
        children: [
          // Container(
          //   height: double.infinity,
          //   width: double.infinity,
          //   decoration: const BoxDecoration(
          //     image: DecorationImage(
          //       image: AssetImage(
          //         "assets/images/category/whitmarble.jpeg",
          //       ),
          //       fit: BoxFit.fill,
          //     ),
          //   ),
          // ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Giva Fashion",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  Padding(
                      padding: EdgeInsets.all(10),
                      child: CarouselSlider(
                        items: [
                          ...List.generate(
                            imgList.length,
                            (index) => Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                    imgList[index],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                        options: CarouselOptions(
                          height: 250,
                          autoPlay: true,
                        ),
                      )),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Expanded(
                      child: GestureDetector(
                        child: SingleChildScrollView(
                          child: Column(
                            children: allCategories
                                .map(
                                  (e) => CategoryView(
                                    category: e,
                                    context: context,
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
