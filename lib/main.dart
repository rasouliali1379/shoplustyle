import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoplustyle/controllers/all_products_page_controller.dart';
import 'package:shoplustyle/controllers/filters_page_controller.dart';
import 'package:shoplustyle/controllers/main_page_controller.dart';
import 'package:shoplustyle/controllers/slider_controller.dart';
import 'package:shoplustyle/pages/all_products_page.dart';
import 'package:shoplustyle/pages/filters_page.dart';
import 'binding/main_page_binding.dart';
import 'pages/main_page.dart';
import 'pages/splash_page.dart';

void main() {
  runApp(GetMaterialApp(
    initialRoute: '/splash_page',
    initialBinding: MainPageBinding(),
    debugShowCheckedModeBanner: false,
    getPages: [
      GetPage(
          name: "/main_page",
          page: () => MainPage()),
      GetPage(
          name: "/splash_page",
          page: () => SplashPage(),
          binding: BindingsBuilder(() => {Get.put(SplashPageController())})),
      GetPage(
          name: "/filters_page",
          page: () => FiltersPage(),
          binding: BindingsBuilder(() => {Get.put(FiltersPageController())})),
      GetPage(
          name: "/all_products_page",
          page: () => AllProductsPage(),
          binding: BindingsBuilder(() => {Get.put(AllProductsPageController())})),
    ],
  ));
}
