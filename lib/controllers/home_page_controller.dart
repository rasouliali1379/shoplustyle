import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoplustyle/controllers/main_page_controller.dart';
import 'package:shoplustyle/models/category_model.dart';
import 'package:shoplustyle/network/api_requests.dart';
import 'package:shoplustyle/repository/category_repository.dart';
import 'package:shoplustyle/utils/consts.dart';
import 'package:shoplustyle/widgets/custom_slider_item.dart';

class HomePageController extends GetxController {
  final MainPageController mainController = Get.find();

  var _sliderIndex = 0.obs;
  var lastScrollPosition = 0.0;
  ScrollController _scrollController;
  var _pageStatus = STATUS_LOADING;
  var _categories = List<CategoryModel>().obs;
  int pageNum = 1;
  int selectedCategoryId = -1;
  List<Widget> _carouselItems;

  final GlobalKey<RefreshIndicatorState> refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  final ApiRequests _apiRequests = ApiRequests();

  get sliderIndex => _sliderIndex.value;

  set sliderIndex(value) {
    _sliderIndex.value = value;
  }


  List<Widget> get carouselItems {
    if(_carouselItems == null){
      carouselSliderWidgets();
    }

    return _carouselItems;
  }

  set carouselItems(List<Widget> value) {
    _carouselItems = value;
  }

  get categories {
    if (_categories.length == 0) {
      refreshIndicatorKey.currentState.show();
      return null;
    }
    return _categories;
  }

  set categories(List<CategoryModel> list) {
    _categories.addAll(list);
  }

  get pageStatus => _pageStatus;

  set pageStatus(value) {
    _pageStatus = value;
    update();
  }

  get scrollController {
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      //Reach Bottom
      if (_scrollController.offset >=
              _scrollController.position.maxScrollExtent &&
          !_scrollController.position.outOfRange) {
        // requestPermitted = false;
        // requestCategories();
      }

      //Reach Top
      if (_scrollController.offset <=
              _scrollController.position.minScrollExtent &&
          !_scrollController.position.outOfRange) {}
    });

    return _scrollController;
  }

  Future<void> requestAllCategories() async {
    categories = await CategoryRepository().getCategories();
  }

  refreshPage() {
    _categories.clear();
    pageNum = 1;
    pageStatus = STATUS_LOADING;
    return requestAllCategories().then((_) => pageStatus = STATUS_SUCCESSFUL);
  }

  GestureTapCallback openAllProducts(int categoryId) {
    return () {
      selectedCategoryId = categoryId;
      Get.toNamed("/all_products_page");
    };
  }

  void carouselSliderWidgets() {
    carouselItems = List<Widget>.from(
        mainController.sliders.map((item) => CustomSliderItem(item)).toList());
  }

  List<CategoryModel> getPureCategories(){
    if(categories != null){
      final pureCategories = List<CategoryModel>();
      pureCategories.addAll(categories);
      pureCategories.removeAt(0);
      return pureCategories;
    }
    return null;
  }
}
