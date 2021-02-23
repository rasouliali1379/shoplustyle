import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:shoplustyle/controllers/main_page_controller.dart';
import 'package:shoplustyle/utils/consts.dart';
import 'package:shoplustyle/widgets/custom_text.dart';
import 'package:shoplustyle/widgets/radiant_gradient_mask.dart';

class CustomAppBar extends StatelessWidget {
  final MainPageController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 4, bottom: 4, right: 8, left: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RadiantGradientMask(
              child: FaIcon(
                FontAwesomeIcons.cog,
                color: Colors.white,
                size: 26,
              ),
            ),
          ),
          Image(
            height: MediaQuery.of(context).size.height * 0.035,
            image: AssetImage('assets/images/app_name.png'),
            alignment: Alignment.centerLeft,
          ),
          GestureDetector(
            onTap: _controller.openBasket(),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RadiantGradientMask(
                    child: FaIcon(
                      FontAwesomeIcons.shoppingBasket,
                      color: Colors.white,
                      size: 26,
                    ),
                  ),
                ),
                Positioned(
                  top: -1,
                  right: 2,
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [PRIMARY_LIGHT, PRIMARY_DARK],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter),
                        border: Border.all(color: Colors.white, width: 2),
                        shape: BoxShape.circle),
                    child:

                    GetX<MainPageController>(
                        builder: (controller) => Padding(
                              padding:
                                  _controller.basketItemsCount.toString().length > 1
                                      ? EdgeInsets.all(3.0)
                                      : EdgeInsets.all(6.0),
                              child: Center(
                                child: CustomText(
                                  text: _controller.basketItemsCount > 9
                                      ? "9+"
                                      : _controller.basketItemsCount.toString(),
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            )),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
