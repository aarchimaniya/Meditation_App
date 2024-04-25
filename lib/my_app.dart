import 'package:allportfolio_advance_flutter/app_routes/app_routes.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        primaryColor: const Color(0xFF75A47F),
        appBarTheme: const AppBarTheme(
          foregroundColor: Color(0xFF9AC8CD),
          backgroundColor: Color(0xFF77B0AA),
          actionsIconTheme: IconThemeData(
            color: Colors.black,
          ),
          centerTitle: true,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          titleSpacing: 1,
        ),
      ),
      darkTheme: ThemeData.dark().copyWith(),
      themeMode: ThemeMode.system,
      routes: AppRoutes.route,
    );
  }
}
