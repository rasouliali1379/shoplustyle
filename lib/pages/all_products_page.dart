import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:shoplustyle/controllers/all_products_page_controller.dart';
import 'package:shoplustyle/controllers/home_page_controller.dart';
import 'package:shoplustyle/utils/consts.dart';
import 'package:shoplustyle/widgets/radiant_gradient_mask.dart';

class AllProductsPage extends StatelessWidget {
  final AllProductsPageController _controller = Get.find();
  final HomePageController homeController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [pageBar(context), productListView()],
        ),
      ),
    );
  }

  Widget pageBar(context) {
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
                padding: const EdgeInsets.only(right: 8),
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
              VerticalDivider(
                thickness: 1,
                color: Colors.black45,
              ),
            ],
          ),
          // filtersRow(),
          Row(
            children: [
              VerticalDivider(
                thickness: 1,
                color: Colors.black45,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8),
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
            ],
          )
        ],
      ),
    );
  }

  Widget productListView() {
    return RefreshIndicator(
      color: PRIMARY_LIGHT,
      onRefresh: () => _controller.refreshPage(),
      key: _controller.refreshIndicatorKey,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        controller: _controller.scrollController,
        child: GetBuilder<AllProductsPageController>(builder: (controller) {
          if (_controller.products == null) {
            return Container();
          } else {
            return ListView(
                padding: EdgeInsets.only(bottom: 100),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: []);
          }
        }),
      ),
    );
  }

  // Widget filtersRow() {
  //   return Expanded(child: ListView.builder(shrinkWrap: true,
  //       itemCount: _controller.categories.length,
  //       itemBuilder: (BuildContext context, int index) {
  //         return ProductRowItem(_controller.categories[index]);
  //       }));
  // }
}
