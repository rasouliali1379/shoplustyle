import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:shoplustyle/controllers/bottom_nav_controller.dart';
import 'package:shoplustyle/utils/consts.dart';
import 'package:shoplustyle/widgets/radiant_gradient_mask.dart';

class CustomBottomNav extends StatelessWidget {

  final navBorderRadius = BorderRadius.circular(20);
  final NavController navController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16.0),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: navBorderRadius,
        ),
        child:
          Container(
            padding: EdgeInsets.only( top: 10, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                navController.selected == 0?
                  RadiantGradientMask(
                    child:
                      FaIcon(
                        FontAwesomeIcons.pencilAlt,
                        color: Colors.white,
                        size: 28,
                      ),
                  ) :
                  GestureDetector(
                    child: FaIcon(
                      FontAwesomeIcons.pencilAlt,
                      color: Colors.grey,
                      size: 28,
                    ),
                    onTap: () => navController.jumpToPage(BLOG_PAGE)
                  ),
                navController.selected == 1?
                RadiantGradientMask(
                  child:
                  FaIcon(
                    FontAwesomeIcons.home,
                    color: Colors.white,
                    size: 28,
                  ),
                ) :
                GestureDetector(
                  child: FaIcon(
                    FontAwesomeIcons.home,
                    color: Colors.grey,
                    size: 28,
                  ),
                  onTap: () => navController.jumpToPage(HOME_PAGE)
                ),
                navController.selected == 2?
                RadiantGradientMask(
                  child:
                    FaIcon(
                      FontAwesomeIcons.user,
                      color: Colors.white,
                      size: 28,
                    ),
                ) :
                GestureDetector(
                  child: FaIcon(
                    FontAwesomeIcons.user,
                    color: Colors.grey,
                    size: 28,
                  ),
                  onTap: () => navController.jumpToPage(SEARCH_PAGE)
                ),
              ],
            ),
          ),
      ),
    );
  }
}
