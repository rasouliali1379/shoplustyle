import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:shoplustyle/controllers/home_page_controller.dart';
import 'package:shoplustyle/modals/categories_modal.dart';
import 'package:shoplustyle/models/category_model.dart';
import 'package:shoplustyle/utils/consts.dart';

import 'custom_text.dart';

class CustomDropDown extends StatelessWidget {
  final String title;
  final String selectedCategory;
  final itemClickListener;
  final List<CategoryModel> categories;

  CustomDropDown(this.title, this.selectedCategory, this.itemClickListener, this.categories);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (context) => CategoriesModal(
              title, categories, itemClickListener)),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: PRIMARY_LIGHT, width: 2),
                    borderRadius: BorderRadius.circular(20.0)),
                padding:
                    EdgeInsets.only(left: 16, right: 16, top: 6, bottom: 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FaIcon(FontAwesomeIcons.caretDown, color: PRIMARY_LIGHT),
                    CustomText(
                      text: selectedCategory,
                      fontSize: 16,
                      color: PRIMARY_LIGHT,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: CustomText(
                  text: title,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
