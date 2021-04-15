import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shoplustyle/controllers/basket_page_controller.dart';
import 'package:shoplustyle/utils/consts.dart';
import 'package:shoplustyle/widgets/custom_text.dart';
import 'package:shoplustyle/widgets/loading.dart';
import 'package:shoplustyle/widgets/radiant_gradient_mask.dart';

class BasketPage extends StatelessWidget {
  final BasketPageController _controller = Get.find();
  final borderRadius = BorderRadius.only(topRight: Radius.circular(20));

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Stack(
          children: [
            CustomScrollView(
              physics: BouncingScrollPhysics(),
              slivers: [
                pageBar(),
                SliverList(
                    delegate: SliverChildListDelegate([
                  GetBuilder<BasketPageController>(
                      builder: (controller) => ListView.builder(
                            padding: EdgeInsets.only(bottom: 100),
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: controller.basketItems.length,
                            itemBuilder: (context, index) =>
                                basketItem(controller.basketItems[index]["id"]),
                          )),
                ]))
              ],
            ),
            // priceBar()
          ],
        ),
      ),
    );
  }

  Widget priceBar() {
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
            children: [totalPrice(), purchaseBtn()],
          ),
        ));
  }

  Widget totalPrice() {
    return Expanded(
        child: GetX<BasketPageController>(
      builder: (controller) => CustomText(
        text: NumberFormat("###,000", "en-US")
                .format(int.parse(_controller.totalPrice)) +
            " تومان ",
        colors: [PRIMARY_DARK, PRIMARY_DARK],
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ));
  }

  Widget purchaseBtn() {
    return Expanded(
      child: Container(),
    );
  }

  Widget pageBar() {
    return SliverAppBar(
      title: CustomText(
        text: "سبد خرید",
        fontSize: 16,
        fontWeight: FontWeight.bold,
        colors: [PRIMARY_LIGHT, PRIMARY_DARK],
      ),
      backgroundColor: Colors.white,
      floating: true,
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
    );
  }

  Widget basketItem(int id) {
    return Container(
      margin: EdgeInsets.only(top: 4, bottom: 4, left: 8, right: 8),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: FutureBuilder(
            future: _controller.getProduct(id),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: loading(size: 25, which: THREE_DOTS),
                );
              } else if (snapshot.hasError) {
                print(snapshot.error);
                return Center(
                  child: CustomText(
                    text: "خطایی رخ داد!",
                  ),
                );
              } else {
                return Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: borderRadius,
                            boxShadow: [
                              BoxShadow(
                                color: PRIMARY_LIGHT.withOpacity(0.5),
                                offset: const Offset(0, 1),
                                blurRadius: 5.0,
                                spreadRadius: 1.0,
                              ),
                            ],
                          ),
                          child: ClipRRect(
                              borderRadius: borderRadius,
                              child: CachedNetworkImage(
                                fit: BoxFit.cover,
                                imageUrl: snapshot.data.images[0].src,
                                placeholder: (context, url) => Center(
                                    child: Wrap(children: [
                                  SpinKitFadingCircle(
                                    color: PRIMARY_LIGHT,
                                  )
                                ])),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              )),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 8, right: 16),
                              child: CustomText(
                                text: snapshot.data.name,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            priceLabel(snapshot.data),
                          ],
                        ),
                      ],
                    )
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }

  Widget priceLabel(data) {
    return data.onSale
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8, right: 16),
                child: CustomText(
                  text: NumberFormat("###,000", "en-US")
                          .format(int.parse(data.regularPrice)) +
                      " تومان ",
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                  textDecoration: TextDecoration.lineThrough,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, right: 16),
                child: CustomText(
                  text: NumberFormat("###,000", "en-US")
                          .format(int.parse(data.salePrice)) +
                      " تومان ",
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  colors: [PRIMARY_LIGHT, PRIMARY_DARK],
                ),
              )
            ],
          )
        : Padding(
            padding: const EdgeInsets.only(top: 8, right: 16),
            child: CustomText(
              text: NumberFormat("###,000", "en-US")
                      .format(int.parse(data.price)) +
                  " تومان ",
              fontSize: 16,
              fontWeight: FontWeight.bold,
              colors: [PRIMARY_LIGHT, PRIMARY_DARK],
            ),
          );
  }
}
