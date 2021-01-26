import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shoplustyle/widgets/radiant_gradient_mask.dart';


class CustomAppBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      child: Align(
        alignment: Alignment.centerRight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            RadiantGradientMask(
              child:
              FaIcon(
                FontAwesomeIcons.user,
                color: Colors.white,
                size: 26,
              ),
            ),
            Image(
              height: MediaQuery.of(context).size.height * 0.035,
              image: AssetImage('assets/images/app_name.png'),
              alignment: Alignment.centerLeft,
            ),
            RadiantGradientMask(
              child:
              FaIcon(
                FontAwesomeIcons.shoppingBasket,
                color: Colors.white,
                size: 26,
              ),
            )
          ],
        ),
      ),
    );
  }
}
