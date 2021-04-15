import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shoplustyle/controllers/home_page_controller.dart';
import 'package:shoplustyle/models/products_model.dart';
import 'package:shoplustyle/pages/filters_page.dart';
import 'package:shoplustyle/repository/products_repository.dart';
import 'package:shoplustyle/utils/consts.dart';
import 'package:shoplustyle/utils/utils.dart';

import 'main_page_controller.dart';

class AllProductsPageController extends GetxController {
  final String controllerId;

  AllProductsPageController(this.controllerId);

  final HomePageController homeController = Get.find();
  final MainPageController mainController = Get.find();
  var _pageStatus = STATUS_LOADING.obs;
  ScrollController _scrollController;
  final _products = List<ProductModel>();
  int pageNum = 1;

  Map<String, String> _filters;
  var _bottomProgressVisibility = true.obs;
  bool requestPermitted = false;

  @override
  void onInit() {
    filters = {"category": mainController.selectedCategoryId.toString()};
    loadPage();
    super.onInit();
  }

  get bottomProgressVisibility => _bottomProgressVisibility.value;

  set bottomProgressVisibility(value) {
    _bottomProgressVisibility.value = value;
  }

  get products => _products;

  set products(value) {
    _products.addAll(value);
    update();
  }

  Map<String, String> get filters {
    if (_filters == null) {
      _filters = Map<String, String>();
    }
    return _filters;
  }

  get pageStatus => _pageStatus.value;

  set pageStatus(value) {
    _pageStatus.value = value;
  }

  set filters(Map<String, String> value) {
    _filters = value;
    update();
  }

  get scrollController {
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      //Reach Bottom
      if (_scrollController.offset >=
              _scrollController.position.maxScrollExtent &&
          !_scrollController.position.outOfRange &&
          bottomProgressVisibility &&
          requestPermitted) {
        requestPermitted = false;
        requestProducts();
      }

      //Reach Top
      if (_scrollController.offset <=
              _scrollController.position.minScrollExtent &&
          !_scrollController.position.outOfRange) {}
    });

    return _scrollController;
  }

  refreshIndicatorHandler() {
    requestPermitted = false;
    _products.clear();
    update();
    pageNum = 1;
    return requestProducts().then((_) => STATUS_SUCCESSFUL);
  }

  loadPage() async {
    requestPermitted = false;
    _products.clear();
    update();
    pageNum = 1;
    await requestProducts().then((_) => pageStatus = STATUS_SUCCESSFUL);
  }

  GestureTapCallback closePage() {
    return () => Get.back();
  }

  GestureTapCallback openFilters(context) {
    return () => Get.to(FiltersPage(controllerId));
  }

  setFilters(Map<String, String> _filters) {
    filters = _filters;
    pageStatus = STATUS_LOADING;
    loadPage();
  }

  removeFilter(String key) {
    return () {
      final tempFilters = filters;
      tempFilters.remove(key);
      filters = tempFilters;
      pageStatus = STATUS_LOADING;
      loadPage();
    };
  }

  String getFilterName(String key, String value) {
    String name = "";
    switch (key) {
      case "category":
        final categories = homeController.categories;
        bool found = false;
        for (final item in categories) {
          if (item.id.toString() == value) {
            name = item.name;
            found = true;
            break;
          }
        }

        if (!found) {
          final subCategories = homeController.subCategories;

          for (final item in subCategories) {
            if (item.id.toString() == value) {
              name = item.name;
              break;
            }
          }
        }

        break;
      case "on_sale":
        name = "کالاهای تخفیف دار";
        break;
      case "in_stock":
        name = "کالاهای موجود";
        break;
      case "min_price":
        name = "حداقل " +
            Utils.toPersianDigits(
                NumberFormat("###,000", "en-US").format(int.parse(value))) +
            " تومان";
        break;
      case "max_price":
        name = "حداکثر " +
            Utils.toPersianDigits(
                NumberFormat("###,000", "en-US").format(int.parse(value))) +
            " تومان";
        break;
    }

    return name;
  }

  Future<void> requestProducts() async {
    final copiedFilters = new Map<String, String>.from(filters)
      ..addAll({"status": "publish", "page": pageNum.toString()});
    print("request sent");
    final receivedProducts =
        await ProductRepository().getFiltered(copiedFilters);

    if (receivedProducts.length < 10) {
      bottomProgressVisibility = false;
    } else {
      requestPermitted = true;
      bottomProgressVisibility = true;
      pageNum++;
    }

    products = receivedProducts;
  }
}
