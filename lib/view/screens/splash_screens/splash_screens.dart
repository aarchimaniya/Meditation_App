import 'dart:async';

import 'package:allportfolio_advance_flutter/app_routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  void changeScreen(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 5),
      () {
        Navigator.of(context).pushReplacementNamed(
          AppRoutes.homepage,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 6), () {
      changeScreen(context);
    });

    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("lib/assets/images/category/splash1.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
