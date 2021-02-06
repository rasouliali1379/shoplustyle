import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoplustyle/models/products_model.dart';
import 'package:shoplustyle/network/api_requests.dart';

class AllProductsPageController extends GetxController {
  final GlobalKey<RefreshIndicatorState> refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  ScrollController _scrollController;
  List<ProductsModel> products;

  get scrollController {
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      //Reach Bottom
      if (_scrollController.offset >=
              _scrollController.position.maxScrollExtent &&
          !_scrollController.position.outOfRange) {

      }

      //Reach Top
      if (_scrollController.offset <=
              _scrollController.position.minScrollExtent &&
          !_scrollController.position.outOfRange) {}
    });

    return _scrollController;
  }

  refreshPage() {}

  GestureTapCallback closePage() {
    return () => Get.back();
  }

  GestureTapCallback openFilters(context) {
    return () => Get.toNamed("/filters_page");
  }
}
