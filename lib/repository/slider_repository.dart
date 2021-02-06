import 'dart:convert';

import 'package:shoplustyle/models/slider_item_model.dart';
import 'package:shoplustyle/network/api_requests.dart';
import 'package:shoplustyle/utils/consts.dart';

class SliderRepository {
  final _apiRequests = ApiRequests();

  Future<List<SliderItemModel>> getSliders() async {
    var response = await _apiRequests.getBanners();

    if (response.statusCode == STATUS_SUCCESS) {
      final rawJson = jsonDecode(response.body)["data"];
      return List<SliderItemModel>.from(
          rawJson.map((model) => SliderItemModel.fromJson(model)));
    }

    return null;
  }
}
