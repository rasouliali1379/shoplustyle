import 'package:flutter/material.dart';

class Consts {
  
  //OAuth
  static const String BASE_URL="https://shoplustyle.ir/";
  static const String WOOCOMMERCE_CONSUMER_KEY ="ck_ed5a505d7532507c105fd41d92cb498abd827eb5";
  static const String WOOCOMMERCE_CONSUMER_SECRET ="cs_4eec410c7c20e759c25ab374a45f22b9178154f9";

  //Pages
  static const int BLOG_PAGE = 0;
  static const int HOME_PAGE = 1;
  static const int SEARCH_PAGE = 2;
  
  
  //Colors
  static const Color PRIMARY_LIGHT = Color.fromRGBO(43, 90, 253, 1);
  static const Color PRIMARY_DARK = Color.fromRGBO(91, 0, 234, 1);

  //Status
  static const int STATUS_SUCCESS = 200;
  static const String STATUS_SUCCESSFUL = "success";
  static const String STATUS_FAILED = "failed";
  static const String STATUS_EMPTY = "empty";
  static const String STATUS_LOADING = "loading";

}