import 'dart:convert';

import 'package:shoplustyle/models/category_model.dart';
import 'package:shoplustyle/network/api_requests.dart';
import 'package:shoplustyle/utils/consts.dart';

class CategoryRepository {
  final ApiRequests _apiRequests = ApiRequests();
  final categories = List<CategoryModel>();
  int pageNum = 1;

  Future<List<CategoryModel>> getCategories() async {
    if (categories.length == 0) {
      categories.insert(0, CategoryModel(id: -1, name: "همه"));
    }

    String result = await requestCategories();

    final rawJson = jsonDecode(result);
    final extractedList = List<CategoryModel>.from(
        rawJson.map((model) => CategoryModel.fromJson(model)));

    categories.addAll(extractedList);

    if (rawJson.length == 10) {
      pageNum++;
      await getCategories();
    }

    return categories;
  }

  Future<String> requestCategories() async {
    Map<String, String> map = {
      "page": pageNum.toString(),
      "hide_empty": "true",
      "parent": "0"
    };
    var response = await _apiRequests.getCategories(map);

    if (response.statusCode == STATUS_SUCCESS) {
      return response.body;
    }

    return "failed";
  }
}
