import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoplustyle/pages/blog_page.dart';
import 'package:shoplustyle/pages/home_page.dart';
import 'package:shoplustyle/pages/profile_page.dart';

class NavController extends GetxController with SingleGetTickerProviderMixin {
  TabController _tabController;

  final pagesInfo = [
    {"name": "Blog", "object": BlogPage()},
    {"name": "Home Page", "object": HomePage()},
    {"name": "Search", "object": ProfilePage()},
  ];

  var _selected = 1;

  get selected => _selected;

  set selected(value) {
    _selected = value;
    _tabController.index = value;
    update();
  }

  switchPage(value) {
    _selected = _tabController.index;
    update();
  }

  get tabController {
    _tabController = TabController(
        initialIndex: selected, length: pagesInfo.length, vsync: this);

    _tabController.addListener(() {
      switchPage(_tabController.index);
    });
    return _tabController;
  }
}
