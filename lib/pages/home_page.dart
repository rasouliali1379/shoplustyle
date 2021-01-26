import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:shoplustyle/controllers/home_page_controller.dart';
import 'package:shoplustyle/utils/consts.dart';
import 'package:shoplustyle/widgets/custom_slider.dart';
import 'package:shoplustyle/widgets/product_item.dart';

class HomePage extends StatelessWidget {
  final HomePageController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RefreshIndicator(
        color: Consts.PRIMARY_LIGHT,
        onRefresh: () => _controller.refreshPage(),
        key: _controller.refreshIndicatorKey,
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          controller: _controller.scrollController,
          child: GetBuilder<HomePageController>(builder: (controller) {
            if (_controller.products == null ||
                controller.pageStatus == Consts.STATUS_LOADING) {
              return Container();
            } else {
              return ListView(
                  padding: EdgeInsets.only(bottom: 100),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    CustomSlider(),
                    productListView(),
                    bottomProgressBar()
                  ]);
            }
          }),
        ),
      ),
    );
  }

  Widget productListView() {
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: _controller.products.length,
        itemBuilder: (BuildContext context, int index) {
          return ProductItem(false, _controller.products[index]);
        });
  }

  Widget bottomProgressBar() {
    return GetBuilder<HomePageController>(builder: (controller) {
      return Visibility(
        visible: controller.progressVisibility,
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.all(16),
          child: SpinKitFadingCircle(
            color: Color.fromRGBO(49, 72, 250, 100),
          ),
        ),
      );
    });
  }
}
