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
  ScrollController _scrollController;
  final GlobalKey<RefreshIndicatorState> refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  final ApiRequests _apiRequests = ApiRequests();

  get pageStatus => _pageStatus.value;

  set pageStatus(value) {
    _pageStatus.value = value;
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
          !_scrollController.position.outOfRange) {
        // refreshIndicatorKey.currentState.show();
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
      print("got here");
      return null;
    }
    return _products.value;
  }

  set products(value) {
    final rawJson = jsonDecode(value);
    final posts = List<ProductsModel>.from(
        rawJson.map((model) => ProductsModel.fromJson(model))).obs;
    _products = posts;
    // update();
  }

  Future<void> requestProducts() async {
    var response = await _apiRequests.getAllProducts();

    if (response.statusCode == Consts.STATUS_SUCCESS) {
      products = response.body;
      pageStatus = Consts.STATUS_SUCCESSFUL;
      update();
    }
  }

  refreshPage() {
    pageStatus = Consts.STATUS_LOADING;
    _products = null;
    update();
    return requestProducts().then((value) => Consts.STATUS_SUCCESSFUL);
  }
}
