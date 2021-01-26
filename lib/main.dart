import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'pages/main_page.dart';
import 'pages/splash_screen.dart';


void main() {
  runApp(GetMaterialApp(
    initialRoute: '/splash_screen',
    debugShowCheckedModeBanner: false,
    routes: {
      '/splash_screen': (context) => SplashScreen(),
      '/home_page': (context) => MainPage(),
    },
  ));
}
