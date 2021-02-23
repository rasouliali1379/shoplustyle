import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shoplustyle/modals/categories_modal.dart';
import 'package:shoplustyle/models/category_model.dart';
import 'package:shoplustyle/utils/consts.dart';

import 'custom_text.dart';

class CategoryDropDown extends StatelessWidget {
  final String title;
  final String selectedCategory;
  final itemClickListener;
  final List<CategoryModel> categories;
  final int parentId;
  final bool subCategory;

  CategoryDropDown(this.title, this.selectedCategory, this.itemClickListener,
      this.categories, this.parentId, this.subCategory);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: CustomText(
                text: title,
                fontSize: 16,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: GestureDetector(
              onTap: () => showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (context) => CategoriesModal(
                      title, categories, itemClickListener, parentId, subCategory)),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: PRIMARY_LIGHT, width: 2),
                    borderRadius: BorderRadius.circular(20.0)),
                padding:
                    EdgeInsets.only(left: 16, right: 16, top: 6, bottom: 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: selectedCategory,
                      fontSize: 16,
                      color: PRIMARY_LIGHT,
                    ),
                    FaIcon(FontAwesomeIcons.caretDown, color: PRIMARY_LIGHT),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
