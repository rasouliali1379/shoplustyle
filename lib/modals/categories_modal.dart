import 'package:flutter/material.dart';
import 'package:shoplustyle/models/category_model.dart';
import 'package:shoplustyle/utils/consts.dart';
import 'package:shoplustyle/widgets/category_drop_down_item.dart';
import 'package:shoplustyle/widgets/custom_text.dart';

class CategoriesModal extends StatelessWidget {
  final String title;
  final List<CategoryModel> categories;
  final itemClickListener;
  final int parentId;
  final bool subCategory;
  CategoriesModal(this.title, this.categories, this.itemClickListener,
      this.parentId, this.subCategory);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.5,
        width: double.maxFinite,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30), topLeft: Radius.circular(30))),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: CustomText(
                fontSize: 18,
                text: title,
              ),
            ),
            Divider(
              color: PRIMARY_LIGHT.withOpacity(0.2),
              height: 1,
              thickness: 1.5,
              indent: 8,
              endIndent: 8,
            ),
            Expanded(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: categories.length,
                itemBuilder: (context, index) => GestureDetector(
                    onTap: itemClickListener(categories[index]),
                    child: CategoryDropDownItem(
                        categories[index], parentId, subCategory)),
              ),
            ),
          ],
        ));
  }
}
