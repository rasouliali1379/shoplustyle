import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:shoplustyle/controllers/home_page_controller.dart';
import 'package:shoplustyle/utils/consts.dart';
import 'package:shoplustyle/widgets/custom_slider.dart';

class HomePage extends StatelessWidget {
  final List<String> entries = <String>[
    'A',
    'B',
    'C',
  ];
  final List<int> colorCodes = <int>[
    600,
    500,
    100,
    600,
    500,
    100,
    600,
    500,
    100,
    600,
    500,
    100,
  ];

  HomePageController _controller = Get.find();

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
            if (_controller.products == null || controller.pageStatus == Consts.STATUS_LOADING) {
              return Container();
            } else {
              return ListView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: [CustomSlider(), productListView()]);
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
          return Container(
            height: 50,
            margin: const EdgeInsets.all(5),
            color: Colors.amber[colorCodes[index]],
            child: Center(child: Text('Entry ${_controller.products[index].name}')),
          );
        });
  }
}
