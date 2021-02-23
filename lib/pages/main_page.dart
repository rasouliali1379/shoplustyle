import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoplustyle/controllers/bottom_nav_controller.dart';
import 'package:shoplustyle/pages/blog_page.dart';
import 'package:shoplustyle/pages/home_page.dart';
import 'package:shoplustyle/pages/profile_page.dart';
import 'package:shoplustyle/widgets/custom_app_bar.dart';
import 'package:shoplustyle/widgets/bottom_nav.dart';

class MainPage extends StatelessWidget {
  final NavController navController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SafeArea(
        child: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Stack(
            children: [
              Container(
                width: double.maxFinite,
                height: double.maxFinite,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    CustomAppBar(),
                    Expanded(
                      child: PageView(
                          onPageChanged: (value) =>
                              navController.selected = value,
                          physics: BouncingScrollPhysics(),
                          controller: navController.pageController,
                          children: [BlogPage(), HomePage(), ProfilePage()]),
                    )
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: GetBuilder<NavController>(
                  builder: (_) => CustomBottomNav(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
