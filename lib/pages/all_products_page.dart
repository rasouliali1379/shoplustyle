import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:shoplustyle/controllers/all_products_page_controller.dart';
import 'package:shoplustyle/utils/consts.dart';
import 'package:shoplustyle/widgets/custom_text.dart';
import 'package:shoplustyle/widgets/filter_item.dart';
import 'package:shoplustyle/widgets/loading.dart';
import 'package:shoplustyle/widgets/product_item.dart';
import 'package:shoplustyle/widgets/radiant_gradient_mask.dart';

class AllProductsPage extends StatelessWidget {
  final String controllerId = Random().nextInt(100).toString();
  @override
  Widget build(BuildContext context) {
    final _controller =
        Get.put(AllProductsPageController(controllerId), tag: controllerId);

    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Column(
          children: [
            pageBar(context),
            GetX(
                assignId: true,
                builder: (_) {
                  if (_controller.pageStatus == STATUS_SUCCESSFUL) {
                    return productListView();
                  } else {
                    return loadingView();
                  }
                })
          ],
        ),
      ),
    );
  }

  Widget pageBar(context) {
    final AllProductsPageController _controller = Get.find(tag: controllerId);
    return Container(
      height: 30,
      margin: EdgeInsets.only(top: 12, bottom: 12, right: 16, left: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: GestureDetector(
                  onTap: _controller.closePage(),
                  child: RadiantGradientMask(
                    child: FaIcon(
                      FontAwesomeIcons.times,
                      color: Colors.white,
                      size: 26,
                    ),
                  ),
                ),
              ),
              VerticalDivider(
                width: 0,
                thickness: 1,
                color: Colors.black45,
              ),
            ],
          ),
          filtersRow(),
          Row(
            children: [
              VerticalDivider(
                width: 0,
                thickness: 1,
                color: Colors.black45,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: GestureDetector(
                  onTap: _controller.openFilters(context),
                  child: RadiantGradientMask(
                    child: FaIcon(
                      FontAwesomeIcons.filter,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget filtersRow() {
    final AllProductsPageController _controller = Get.find(tag: controllerId);
    return GetBuilder<AllProductsPageController>(
        tag: controllerId,
        builder: (_) {
          if (_controller.filters.length == 0) {
            return Expanded(
                child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8, left: 8),
                  child: CustomText(
                    text: "فیلتر اضافه کنید",
                    fontSize: 15,
                  ),
                ),
                RadiantGradientMask(
                  child: FaIcon(
                    FontAwesomeIcons.longArrowAltLeft,
                    color: Colors.white,
                    size: 22,
                  ),
                )
              ],
            ));
          } else {
            return Expanded(
                child: ListView.builder(
              padding: EdgeInsets.only(left: 8, right: 8),
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              itemCount: _controller.filters.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: _controller
                    .removeFilter(_controller.filters.keys.toList()[index]),
                child: FilterItem(_controller.getFilterName(
                    _controller.filters.keys.toList()[index],
                    _controller.filters.values.toList()[index])),
              ),
            ));
          }
        });
  }

  Widget productListView() {
    final AllProductsPageController _controller = Get.find(tag: controllerId);
    return Expanded(
      child: RefreshIndicator(
        color: PRIMARY_LIGHT,
        onRefresh: () => _controller.refreshIndicatorHandler(),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          controller: _controller.scrollController,
          child: GetBuilder<AllProductsPageController>(
              tag: controllerId,
              builder: (controller) {
                if (_controller.products.length == 0) {
                  return Container();
                } else {
                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      ListView.builder(
                        itemCount: _controller.products.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                              onTap: _controller.mainController
                                  .openProductPage(_controller.products[index]),
                              child: ProductItem(
                                  _controller.products[index], true));
                        },
                      ),
                      Visibility(
                          visible: _controller.bottomProgressVisibility,
                          child: Container(
                            margin: EdgeInsets.all(16),
                            child: SpinKitFadingCircle(
                              color: PRIMARY_LIGHT,
                              size: 40,
                            ),
                          ))
                    ],
                  );
                }
              }),
        ),
      ),
    );
  }

  Widget loadingView() {
    return Expanded(
        child: Center(
      child: loading(),
    ));
  }
}
