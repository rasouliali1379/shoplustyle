import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoplustyle/controllers/home_page_controller.dart';
import 'package:shoplustyle/models/category_model.dart';
import 'package:shoplustyle/utils/consts.dart';
import 'package:shoplustyle/widgets/custom_text.dart';

class CategoryDropDownItem extends StatelessWidget {
  final CategoryModel category;
  final int parentId;
  final bool subCategory;

  CategoryDropDownItem(this.category, this.parentId, this.subCategory);

  final HomePageController homeController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: PRIMARY_LIGHT.withOpacity(0.5), width: 1)),
      margin: EdgeInsets.only(top: 4, bottom: 4, left: 8, right: 8),
      padding: EdgeInsets.only(top: 12, bottom: 12, left: 16, right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
            text: category.name,
            fontSize: 16,
          ),
          CustomText(
            text: category.id == -1
                ? homeController.getAllCategoriesProductsCount(subCategory, parentId)
                : category.count.toString() + " مورد",
            fontSize: 16,
            color: Colors.black.withOpacity(0.5),
          ),
        ],
      ),
    );
  }
}
