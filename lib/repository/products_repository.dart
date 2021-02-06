import 'dart:convert';

import 'package:shoplustyle/models/products_model.dart';
import 'package:shoplustyle/network/api_requests.dart';
import 'package:shoplustyle/utils/consts.dart';

class ProductRepository {
  final _apiRequests = ApiRequests();

  Future<List<ProductsModel>> getByCategory(int categoryId) async {
    Map<String, String> map = {
      "category": categoryId.toString(),
      "status": "publish"
    };

    var response = await _apiRequests.getProducts(map);

    if (response.statusCode == STATUS_SUCCESS) {
      final rawJson = jsonDecode(response.body);
      var products;

      products = List<ProductsModel>.from(
          rawJson.map((model) => ProductsModel.fromJson(model)));

      return products;
    }

    return null;
  }

  Future<List<String>> getPriceRange(int id) async {
    var priceList;

    var response = await _apiRequests.getProductVariations(id);

    if (response.statusCode == STATUS_SUCCESS) {
      final rawJson = jsonDecode(response.body);
      priceList = List<String>.from(rawJson.map((model) => model["price"]));

      priceList.sort((a, b) => int.parse(a).compareTo(int.parse(b)));
    }

    return priceList;
  }
}
