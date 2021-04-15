import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:shoplustyle/controllers/basket_page_controller.dart';
import 'package:shoplustyle/controllers/splash_page_controller.dart';
import 'package:shoplustyle/pages/all_products_page.dart';
import 'package:shoplustyle/pages/basket_page.dart';
import 'binding/main_page_binding.dart';
import 'pages/main_page.dart';
import 'pages/splash_page.dart';

void main() {
  runApp(GetMaterialApp(
    initialRoute: '/splash_page',
    initialBinding: MainPageBinding(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: Colors.transparent
      )
    ),
    localizationsDelegates: [
      GlobalCupertinoLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    supportedLocales: [
      Locale("fa", "IR"),
    ],
    locale: Locale("fa", "IR"),
    getPages: [
      GetPage(name: "/main_page", page: () => MainPage()),
      GetPage(
          name: "/splash_page",
          page: () => SplashPage(),
          binding: BindingsBuilder(() => {Get.put(SplashPageController())})),
      GetPage(
          name: "/all_products_page",
          page: () => AllProductsPage()),
      GetPage(
          name: "/basket_page",
          page: () => BasketPage(),
          binding: BindingsBuilder(() => {Get.put(BasketPageController())})),
    ],
  ));
}
