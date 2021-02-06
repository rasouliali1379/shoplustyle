import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoplustyle/controllers/home_page_controller.dart';
import 'package:shoplustyle/controllers/slider_controller.dart';
import 'package:shoplustyle/controllers/bottom_nav_controller.dart';
import 'package:shoplustyle/pages/blog_page.dart';
import 'package:shoplustyle/pages/home_page.dart';
import 'package:shoplustyle/pages/profile_page.dart';
import 'package:shoplustyle/widgets/custom_app_bar.dart';
import 'package:shoplustyle/widgets/bottom_nav.dart';

class MainPage extends StatelessWidget {
  final HomePageController homePageController = Get.find();
  final SplashPageController bannerController = Get.find();
  final NavController navController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        body: SafeArea(
          child: Container(
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Wrap(
                        children: [CustomAppBar()],
                      ),

                      Expanded(
                        child: NotificationListener<OverscrollIndicatorNotification>(
                          onNotification: (notification) {

                            notification.disallowGlow();
                            return;
                          },
                          child: TabBarView(
                              controller: navController.tabController,
                              children: [BlogPage(), HomePage(), ProfilePage()]),
                        ),
                      )
                      // GetBuilder<NavController>(
                      //   builder: (value) {
                      //     return value.pagesInfo[value.selected]
                      //         ["object"];
                      //   },
                      // ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Wrap(
                    children: [
                      GetBuilder<NavController>(
                        builder: (_) => CustomBottomNav(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
