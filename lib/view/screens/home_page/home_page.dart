import 'dart:io';

import 'package:allportfolio_advance_flutter/app_routes/app_routes.dart';
import 'package:allportfolio_advance_flutter/componets/category_view.dart';
import 'package:allportfolio_advance_flutter/utilies/product_utiles.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

final List<String> imgList = [
  "lib/assets/images/category/image1.jpg",
  "lib/assets/images/category/image2.jpg",
  "lib/assets/images/category/aimage1.jpeg",
  "lib/assets/images/category/bimage2.jpeg",
  "lib/assets/images/category/cimage3.jpeg",
];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration.zero,
      () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("To know yourself is to be confident"),
            content: const Text("Relaxing"),
            actions: [
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Allow"),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Denny"),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (val) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("EXTIS"),
            content: Text("Are you sure exit??"),
            actions: [
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      exit(0);
                    },
                    child: Text("Yes"),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("No"),
                  ),
                ],
              ),
            ],
          ),
        );
      },
      child: Scaffold(
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
                      "LightThread Your Mind",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
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
      ),
    );
  }
}
