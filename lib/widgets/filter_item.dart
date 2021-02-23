import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shoplustyle/utils/consts.dart';
import 'package:shoplustyle/widgets/radiant_gradient_mask.dart';

import 'custom_text.dart';

class FilterItem extends StatelessWidget {

  final String title;


  FilterItem(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 4, right: 4),
      padding: EdgeInsets.only(left: 16,right: 4),
      decoration: BoxDecoration(
          border: Border.all(color: PRIMARY_LIGHT, width: 2),
          borderRadius: BorderRadius.circular(20.0)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RadiantGradientMask(child: FaIcon(FontAwesomeIcons.timesCircle, color: Colors.white,size: 18,)),
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: CustomText(
              fontSize: 14,
              text: title,
              colors: [
                PRIMARY_LIGHT,
                PRIMARY_DARK
              ],
            ),
          ),
        ],
      ),
    );
  }
}
