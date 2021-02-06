import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoplustyle/controllers/home_page_controller.dart';
import 'package:shoplustyle/utils/consts.dart';
import 'package:shoplustyle/widgets/custom_slider.dart';
import 'package:shoplustyle/widgets/product_row_item.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  final HomePageController _controller = Get.find();

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return RefreshIndicator(
      color: PRIMARY_LIGHT,
      onRefresh: () => _controller.refreshPage(),
      key: _controller.refreshIndicatorKey,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        controller: _controller.scrollController,
        child: GetX<HomePageController>(builder: (controller) {
          if (_controller.getPureCategories() == null) {
            return Container();
          } else {
            return ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [CustomSlider(), productListView()]);
          }
        }),
      ),
    );
  }

  Widget productListView() {
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: _controller.getPureCategories().length,
        itemBuilder: (BuildContext context, int index) {
          return ProductRowItem(_controller.getPureCategories()[index]);
        });
  }
}
