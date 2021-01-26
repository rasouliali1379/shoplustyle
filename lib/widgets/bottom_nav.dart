import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:shoplustyle/controllers/bottom_nav_controller.dart';
import 'package:shoplustyle/utils/consts.dart';
import 'package:shoplustyle/widgets/radiant_gradient_mask.dart';

class CustomBottomNav extends StatelessWidget {

  var navBorderRadius = BorderRadius.circular(20);
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
                navController.selected.value == 0?
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
                    onTap: () => navController.switchPage(Consts.BLOG_PAGE)
                  ),
                navController.selected.value == 1?
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
                  onTap: () => navController.switchPage(Consts.HOME_PAGE)
                ),
                navController.selected.value == 2?
                RadiantGradientMask(
                  child:
                    FaIcon(
                      FontAwesomeIcons.search,
                      color: Colors.white,
                      size: 28,
                    ),
                ) :
                GestureDetector(
                  child: FaIcon(
                    FontAwesomeIcons.search,
                    color: Colors.grey,
                    size: 28,
                  ),
                  onTap: () => navController.switchPage(Consts.SEARCH_PAGE)
                ),
              ],
            ),
          ),
      ),
    );
  }
}
