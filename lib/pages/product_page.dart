import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' as Intl;
import 'package:shoplustyle/controllers/product_page_controller.dart';
import 'package:shoplustyle/models/products_model.dart';
import 'package:shoplustyle/repository/products_repository.dart';
import 'package:shoplustyle/utils/consts.dart';
import 'package:shoplustyle/utils/utils.dart';
import 'package:shoplustyle/widgets/custom_button.dart';
import 'package:shoplustyle/widgets/custom_text.dart';
import 'package:shoplustyle/widgets/loading.dart';
import 'package:shoplustyle/widgets/product_item.dart';
import 'package:shoplustyle/widgets/radiant_gradient_mask.dart';

class ProductPage extends StatelessWidget {
  final ProductModel product;

  ProductPage(this.product);

  ProductPageController _controller;

  @override
  Widget build(BuildContext context) {
    _controller =
        Get.put(ProductPageController(product), tag: product.id.toString());
    return Container(
      color: Colors.white,
      child: SafeArea(
          child: Stack(children: [
        CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            pageBar(),
            SliverList(
                delegate: SliverChildListDelegate([
              productInfo(),
              imageListSeparator(),
              imageList(),
              productDesc(),
              productAttributes(),
              relatedProducts()
            ]))
          ],
        ),
        priceBar(context)
      ])),
    );
  }

  Widget relatedProducts() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 100),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          relatedProductsSeparator(),
          AspectRatio(
              aspectRatio: 5 / 4,
              child: FutureBuilder(
                initialData: null,
                future: _controller.getRelatedProducts(),
                builder: (context, snapshot) {
                  return snapshot.data == null
                      ? loading(size: 25, which: THREE_DOTS)
                      : relatedProductListView(snapshot.data);
                },
              ))
        ],
      ),
    );
  }

  Widget relatedProductListView(List<ProductModel> list) {
    return Align(
      alignment: Alignment.centerLeft,
      child: ListView.builder(
          padding: EdgeInsets.only(left: 8, right: 8),
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          itemCount: list.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
                onTap: _controller.mainController.openProductPage(list[index]),
                child: ProductItem(list[index], false));
          }),
    );
  }

  Widget productAttributes() {
    return Builder(
      builder: (context) {
        if (product.attributes.length > 0) {
          return Column(
            children: [
              productAttributeSeparator(),
              Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: product.attributes.length,
                    itemBuilder: (context, index) {
                      return attributeItem(product.attributes[index]);
                    },
                  ))
            ],
          );
        } else {
          return Container();
        }
      },
    );
  }

  Widget attributeItem(Attributes attribute) {
    return Container(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
              child: CustomText(
            text: attribute.name,
            fontSize: 16,
          )),
          VerticalDivider(
            thickness: 1.5,
            endIndent: 5,
            indent: 5,
            width: 30,
          ),
          Expanded(
              flex: 3,
              child: CustomText(
                text: Utils.mergeArrayItems(attribute.options, " - "),
                fontSize: 14,
                maxLines: -1,
              ))
        ],
      ),
    );
  }

  Widget productDesc() {
    return Builder(builder: (context) {
      if (Utils.removeAllHtmlTags(product.description).length > 0) {
        return Column(
          children: [
            productDescSeparator(),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
              child: CustomText(
                text: Utils.removeAllHtmlTags(product.description),
                maxLines: -1,
                fontSize: 16,
                height: 2,
                textAlign: TextAlign.justify,
              ),
            )
          ],
        );
      } else {
        return Container();
      }
    });
  }

  Widget imageListSeparator() {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 4),
      child: Row(
        children: [
          CustomText(
            text: "تصاویر محصول",
            fontWeight: FontWeight.bold,
            fontSize: 14,
            colors: [PRIMARY_LIGHT, PRIMARY_DARK],
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(right: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                    colors: [PRIMARY_LIGHT, PRIMARY_DARK],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter),
              ),
              height: 3,
              width: double.maxFinite,
            ),
          )
        ],
      ),
    );
  }

  Widget relatedProductsSeparator() {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 4),
      child: Row(
        children: [
          CustomText(
            text: "محصولات مرتبط",
            fontWeight: FontWeight.bold,
            fontSize: 14,
            colors: [PRIMARY_LIGHT, PRIMARY_DARK],
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(right: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                    colors: [PRIMARY_LIGHT, PRIMARY_DARK],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter),
              ),
              height: 3,
              width: double.maxFinite,
            ),
          ),
        ],
      ),
    );
  }

  Widget productAttributeSeparator() {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 4),
      child: Row(
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                    colors: [PRIMARY_LIGHT, PRIMARY_DARK],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter),
              ),
              height: 3,
              width: double.maxFinite,
            ),
          ),
          CustomText(
            text: "ویژگی های محصول",
            fontWeight: FontWeight.bold,
            fontSize: 14,
            colors: [PRIMARY_LIGHT, PRIMARY_DARK],
          ),
        ],
      ),
    );
  }

  Widget productDescSeparator() {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 4),
      child: Row(
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                    colors: [PRIMARY_LIGHT, PRIMARY_DARK],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter),
              ),
              height: 3,
              width: double.maxFinite,
            ),
          ),
          CustomText(
            text: "توضیحات محصول",
            fontWeight: FontWeight.bold,
            fontSize: 14,
            colors: [PRIMARY_LIGHT, PRIMARY_DARK],
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(right: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                    colors: [PRIMARY_LIGHT, PRIMARY_DARK],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter),
              ),
              height: 3,
              width: double.maxFinite,
            ),
          )
        ],
      ),
    );
  }

  Widget imageList() {
    return AspectRatio(
      aspectRatio: 1.5,
      child: ListView.builder(
        padding: EdgeInsets.only(left: 8, right: 8),
        scrollDirection: Axis.horizontal,
        itemCount: _controller.carouselItems.length,
        itemBuilder: (context, index) => _controller.carouselItems[index],
        physics: BouncingScrollPhysics(),
      ),
    );
  }

  Widget getPriceLabel() {
    if (_controller.openProduct.type == "variable") {
      return getRangedPriceLabel();
    } else {
      if (_controller.openProduct.onSale) {
        return getOnSalePriceLabel();
      } else {
        return getSimplePriceLabel();
      }
    }
  }

  Widget getRangedPriceLabel() {
    return Expanded(
      child: FutureBuilder(
          future: ProductRepository().getPriceRange(_controller.openProduct.id),
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return loading(size: 20, which: THREE_DOTS);
            } else {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  CustomText(
                    text: " از " +
                        Intl.NumberFormat("###,000", "en-US")
                            .format(int.parse(snapshot.data[0])) +
                        " تومان ",
                    fontSize: 16,
                    colors: [PRIMARY_LIGHT, PRIMARY_DARK],
                    fontWeight: FontWeight.bold,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: CustomText(
                      text: " تا " +
                          Intl.NumberFormat("###,000", "en-US").format(
                              int.parse(
                                  snapshot.data[snapshot.data.length - 1])) +
                          " تومان ",
                      colors: [PRIMARY_LIGHT, PRIMARY_DARK],
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              );
            }
          }),
    );
  }

  Widget getOnSalePriceLabel() {
    return Expanded(
      child: Material(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            CustomText(
              text: Intl.NumberFormat("###,000", "en-US")
                      .format(int.parse(_controller.openProduct.regularPrice)) +
                  " تومان ",
              fontSize: 14,
              fontWeight: FontWeight.bold,
              textDecoration: TextDecoration.lineThrough,
              color: Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: CustomText(
                text: Intl.NumberFormat("###,000", "en-US")
                        .format(int.parse(_controller.openProduct.price)) +
                    " تومان ",
                colors: [PRIMARY_LIGHT, PRIMARY_DARK],
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getSimplePriceLabel() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: CustomText(
          text: Intl.NumberFormat("###,000", "en-US")
                  .format(int.parse(_controller.openProduct.price)) +
              " تومان ",
          colors: [PRIMARY_LIGHT, PRIMARY_DARK],
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget getProductStatus(context) {
    return Expanded(
      child: GetX<ProductPageController>(
        tag: product.id.toString(),
        builder: (controller) {
          if (controller.buyBtnStatus == STATUS_LOADING) {
            return Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: PRIMARY_LIGHT, width: 2),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.4),
                        offset: const Offset(0, 0.5),
                        blurRadius: 3),
                  ],
                  borderRadius: BorderRadius.circular(30.0)),
              padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
              margin: EdgeInsets.only(top: 3, bottom: 3),
              child: loading(size: 22, which: THREE_DOTS),
            );
          } else {
            if (controller.selectedProductId > 0) {
              return Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: PRIMARY_LIGHT, width: 2),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.4),
                          offset: const Offset(0, 0.5),
                          blurRadius: 3),
                    ],
                    borderRadius: BorderRadius.circular(30.0)),
                padding:
                    EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
                margin: EdgeInsets.only(top: 3, bottom: 3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                        child: Icon(Icons.add),
                        onTap: controller.increaseQuantity()),
                    CustomText(
                        text: controller.quantity.toString(), fontSize: 18),
                    GestureDetector(
                        child: Icon(Icons.remove),
                        onTap: controller.decreaseQuantity()),
                  ],
                ),
              );
            } else {
              return CustomButton(
                onPressed: _controller.addProductToBasket(context),
                text: "افزودن به سبد",
                textSize: 14,
                textWeight: FontWeight.bold,
                gradientColors: [PRIMARY_LIGHT, PRIMARY_DARK],
              );
            }
          }
        },
      ),
    );
  }

  Widget productInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              const EdgeInsets.only(top: 8, left: 16, right: 16, bottom: 8),
          child: CustomText(
            text: _controller.openProduct.name,
            fontSize: 30,
            maxLines: 3,
          ),
        ),
        Container(
          height: 22,
          child: ListView.builder(
            padding: const EdgeInsets.only(left: 8, right: 8),
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: _controller.openProduct.categories.length,
            itemBuilder: (context, index) =>
                categoryItem(_controller.openProduct.categories[index]),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 16),
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              shopName(),
              VerticalDivider(
                thickness: 1.5,
              ),
              rating(),
            ],
          ),
        )
      ],
    );
  }

  Widget rating() {
    return Expanded(
        child: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomText(
          text: product.averageRating,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 4, bottom: 4),
          child: CustomText(
            text: _controller.getReviewStatus(),
          ),
        ),
        RatingBar.builder(
          itemSize: 15,
          initialRating: double.parse(product.averageRating),
          minRating: 0,
          ignoreGestures: true,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
          itemBuilder: (context, _) => Icon(
            Icons.star,
            color: PRIMARY_LIGHT,
          ),
          onRatingUpdate: (rating) {
            print(rating);
          },
        )
      ],
    )));
  }

  Widget shopName() {
    return Expanded(
        child: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 2),
          child: CustomText(
            text: "نام فروشنده",
          ),
        ),
        CustomText(
          fontSize: 14,
          maxLines: 1,
          fontWeight: FontWeight.bold,
          colors: [PRIMARY_LIGHT, PRIMARY_DARK],
          text: product.store.shopName,
        ),
      ],
    )));
  }

  Widget pageBar() {
    return SliverAppBar(
      floating: true,
      title: CustomText(
        text: "توضیحات محصول",
        fontSize: 16,
        fontWeight: FontWeight.bold,
        colors: [PRIMARY_LIGHT, PRIMARY_DARK],
      ),
      backgroundColor: Colors.white,
      leading: Center(
        child: GestureDetector(
          onTap: _controller.closePage(),
          child: Padding(
            padding: const EdgeInsets.only(left: 0),
            child: RadiantGradientMask(
              child: FaIcon(
                FontAwesomeIcons.times,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      actions: [
        Center(
            child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: RadiantGradientMask(
                child: FaIcon(
                  FontAwesomeIcons.heart,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: RadiantGradientMask(
                child: FaIcon(
                  FontAwesomeIcons.share,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        )),
      ],
    );
  }

  Widget priceBar(context) {
    return Positioned(
        bottom: 0,
        right: 0,
        left: 0,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                offset: const Offset(0, 1),
                blurRadius: 5.0,
                spreadRadius: 1.0,
              ),
            ],
          ),
          padding: EdgeInsets.only(left: 16, top: 8, right: 16, bottom: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [getPriceLabel(), getProductStatus(context)],
          ),
        ));
  }

  Widget categoryItem(category) {
    return GestureDetector(
      onTap: _controller.openAllProducts(category.id),
      child: Container(
        margin: EdgeInsets.only(left: 4, right: 4),
        padding: EdgeInsets.only(left: 16, right: 16),
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              PRIMARY_LIGHT.withOpacity(0.8),
              PRIMARY_DARK.withOpacity(0.8)
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
            borderRadius: BorderRadius.circular(20.0)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomText(
              text: category.name,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 10,
            ),
          ],
        ),
      ),
    );
  }
}
