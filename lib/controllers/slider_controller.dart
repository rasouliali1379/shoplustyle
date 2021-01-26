import 'dart:convert';

import 'package:get/get.dart';
import 'package:shoplustyle/models/slider_item_model.dart';
import 'package:shoplustyle/network/api_requests.dart';
import 'package:shoplustyle/pages/main_page.dart';

class SliderController extends GetxController {

  var _imageList;
  var _slide = 0.obs;
  final apiRequests = ApiRequests();

  get slide => _slide.value;

  set slide(value) {
    _slide.value = value;
    update();
  }

  get imageList => _imageList;

  set imageList(String value) {
    final rawJson = jsonDecode(value)["data"];
    final posts = List<SliderItemModel>.from(rawJson.map((model)=> SliderItemModel.fromJson(model)));
    _imageList = posts;
  }

  void getBanners() async {
    var response = await apiRequests.getBanners();
    imageList = response.body;
    Get.off(MainPage());
  }
}
