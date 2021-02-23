import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoplustyle/pages/blog_page.dart';
import 'package:shoplustyle/pages/home_page.dart';
import 'package:shoplustyle/pages/profile_page.dart';

class NavController extends GetxController with SingleGetTickerProviderMixin {
  PageController _pageController;

  final pagesInfo = [
    {"name": "Blog", "object": BlogPage()},
    {"name": "Home Page", "object": HomePage()},
    {"name": "Search", "object": ProfilePage()},
  ];

  var _selected = 1.obs;

  get selected => _selected.value;

  set selected(value) {
    _selected.value = value;
    update();
  }

  jumpToPage(int value){
    _pageController.jumpToPage(value);
    selected = value;
  }

  get pageController {
    _pageController = PageController(
        initialPage: selected);

    return _pageController;
  }
}
