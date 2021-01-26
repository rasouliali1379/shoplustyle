import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoplustyle/models/products_model.dart';
import 'package:shoplustyle/network/api_requests.dart';
import 'package:shoplustyle/utils/consts.dart';

class HomePageController extends GetxController {
  var _lastScrollPosition = 0.0.obs;
  var _products;
  var _pageStatus = Consts.STATUS_LOADING.obs;
  var _progressVisibility = true.obs;
  bool requestPermitted = false;

  int pageNum = 1;
  String order = "asc";
  String orderBy = "date";

  ScrollController _scrollController;
  final GlobalKey<RefreshIndicatorState> refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  final ApiRequests _apiRequests = ApiRequests();

  get progressVisibility => _progressVisibility.value;

  set progressVisibility(value) {
    _progressVisibility.value = value;
    update();
  }

  get pageStatus => _pageStatus.value;

  set pageStatus(value) {
    _pageStatus.value = value;
    update();
  }

  get lastScrollPosition => _lastScrollPosition.value;

  set lastScrollPosition(value) {
    _lastScrollPosition.value = value;
  }

  get scrollController {
    _scrollController =
        ScrollController(initialScrollOffset: lastScrollPosition);
    _scrollController.addListener(() {
      //Reach Bottom
      if (_scrollController.offset >=
              _scrollController.position.maxScrollExtent &&
          !_scrollController.position.outOfRange && requestPermitted) {
        requestPermitted = false;
        requestProducts();
      }

      //Reach Top
      if (_scrollController.offset <=
              _scrollController.position.minScrollExtent &&
          !_scrollController.position.outOfRange) {}

      lastScrollPosition = _scrollController.offset;
    });

    return _scrollController;
  }

  get products {
    if (_products == null) {
      refreshIndicatorKey.currentState.show();
      return null;
    }
    return _products.value;
  }

  set products(value) {
    final rawJson = jsonDecode(value);
    if (_products == null) {
      final posts = List<ProductsModel>.from(
          rawJson.map((model) => ProductsModel.fromJson(model))).obs;
      _products = posts;
    } else {
      for (var item in rawJson) {
        _products.add(ProductsModel.fromJson(item));
      }
    }

     update();
  }

  Future<void> requestProducts() async {

    Map<String, String> map = {
      "page": pageNum.toString(),
      "order": order,
      "orderby": orderBy
    };

    var response = await _apiRequests.getProducts(map);

    if (response.statusCode == Consts.STATUS_SUCCESS) {
      pageStatus = Consts.STATUS_SUCCESSFUL;
      if(jsonDecode(response.body).length == 10){
        requestPermitted = true;
        progressVisibility = true;
        pageNum += 1;
      } else {
        progressVisibility = false;
      }
      products = response.body;
    }
  }

  refreshPage() {
    pageStatus = Consts.STATUS_LOADING;
    _products = null;
    pageNum = 1;
    update();

    return requestProducts().then((value) => Consts.STATUS_SUCCESSFUL);
  }
}
