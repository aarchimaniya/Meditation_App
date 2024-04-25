import 'package:allportfolio_advance_flutter/view/screens/detail_page/detail_page.dart';
import 'package:allportfolio_advance_flutter/view/screens/home_page/home_page.dart';
import 'package:allportfolio_advance_flutter/view/screens/splash_screens/splash_screens.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static String splashscreen = "/";
  static String homepage = "home_page";
  static String detailpage = "detail_page";

  static Map<String, WidgetBuilder> route = {
    splashscreen: (context) => const SplashScreen(),
    homepage: (context) => const HomePage(),
    detailpage: (context) => const DetailPage(),
  };
}
