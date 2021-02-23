import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:shoplustyle/controllers/home_page_controller.dart';
import 'package:shoplustyle/models/category_model.dart';
import 'package:shoplustyle/models/products_model.dart';
import 'package:shoplustyle/repository/products_repository.dart';
import 'package:shoplustyle/utils/consts.dart';
import 'package:shoplustyle/widgets/custom_text.dart';
import 'package:shoplustyle/widgets/loading.dart';
import 'package:shoplustyle/widgets/product_item.dart';

class ProductRowItem extends StatelessWidget {
  final HomePageController _controller = Get.find();
  final CategoryModel _category;

  ProductRowItem(this._category);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 8),
      height: 350,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 16, left: 16, bottom: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: _category.name,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: PRIMARY_LIGHT,
                  colors: [PRIMARY_LIGHT, PRIMARY_DARK],
                ),
                moreProductsBtn()
              ],
            ),
          ),
          Expanded(
              child: FutureBuilder(
            initialData: null,
            future: ProductRepository().getByCategory(_category.id),
            builder: (context, snapshot) {
              return snapshot.data == null
                  ? loading(size: 25, which: THREE_DOTS)
                  : productListView(snapshot.data);
            },
          ))
        ],
      ),
    );
  }

  Widget productListView(List<ProductModel> list) {
    return Align(
      alignment: Alignment.centerLeft,
      child: ListView.builder(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.only(left: 8, right: 8),
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: list.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
                onTap: _controller.mainController.openProductPage(list[index]),
                child: ProductItem(list[index], false));
          }),
    );
  }

  Widget moreProductsBtn() {
    return GestureDetector(
      onTap: _controller.openAllProducts(_category.id),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        child: Container(
          padding: const EdgeInsets.only(left: 8, right: 8),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [PRIMARY_LIGHT, PRIMARY_DARK])),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: CustomText(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    text: "همه محصولات",
                    color: Colors.white),
              ),
              FaIcon(
                FontAwesomeIcons.longArrowAltLeft,
                color: Colors.white,
                size: 22,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
