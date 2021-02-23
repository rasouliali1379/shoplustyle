import 'dart:convert';

import 'package:shoplustyle/models/category_model.dart';
import 'package:shoplustyle/network/api_requests.dart';
import 'package:shoplustyle/utils/consts.dart';

class CategoryRepository {
  final ApiRequests _apiRequests = ApiRequests();
  int pageNum = 1;

  Future<List<CategoryModel>> getAllCategories() async {

    Map<String, String> map = {
      "page": pageNum.toString(),
      "hide_empty": "true"
    };

    String result = await requestCategories(map);

    final rawJson = jsonDecode(result);
    final extractedList = List<CategoryModel>.from(
        rawJson.map((model) => CategoryModel.fromJson(model)));

    final categories = List<CategoryModel>();

    categories.addAll(extractedList);

    if (rawJson.length == 10) {
      pageNum++;
      await getAllCategories();
    }

    return categories;
  }

  Future<String> requestCategories(Map<String, String> map) async {

    var response = await _apiRequests.getCategories(map);

    if (response.statusCode == STATUS_SUCCESS) {
      return response.body;
    }

    return "failed";
  }
}
