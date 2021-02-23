import 'dart:convert';

import 'package:shoplustyle/models/products_model.dart';
import 'package:shoplustyle/models/variation_model.dart';
import 'package:shoplustyle/network/api_requests.dart';
import 'package:shoplustyle/utils/consts.dart';

class ProductRepository {
  final _apiRequests = ApiRequests();

  Future<List<ProductModel>> getByCategory(int categoryId) async {
    Map<String, String> map = {
      "category": categoryId.toString(),
      "status": "publish"
    };

    var response = await _apiRequests.getProducts(map);

    if (response.statusCode == STATUS_SUCCESS) {
      final rawJson = jsonDecode(response.body);
      var products;

      products = List<ProductModel>.from(
          rawJson.map((model) => ProductModel.fromJson(model)));

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

  Future<List<VariationModel>> getProductVariations(int id) async {
    var priceList;

    var response = await _apiRequests.getProductVariations(id);

    if (response.statusCode == STATUS_SUCCESS) {
      final rawJson = jsonDecode(response.body);
      priceList = List<VariationModel>.from(
          rawJson.map((model) => VariationModel.fromJson(model)));

      priceList
          .sort((a, b) => int.parse(a.price).compareTo(int.parse(b.price)));
    }

    return priceList;
  }

  Future<List<ProductModel>> getFiltered(Map<String, String> filters) async {
    var response = await _apiRequests.getProducts(filters);

    if (response.statusCode == STATUS_SUCCESS) {
      final rawJson = jsonDecode(response.body);

      final products = List<ProductModel>.from(
          rawJson.map((model) => ProductModel.fromJson(model)));
      return products;
    }

    return null;
  }

  Future<List<ProductModel>> getProductsById(
      Map<String, String> filters) async {
    var response = await _apiRequests.getProducts(filters);

    if (response.statusCode == STATUS_SUCCESS) {
      final rawJson = jsonDecode(response.body);

      final products = List<ProductModel>.from(
          rawJson.map((model) => ProductModel.fromJson(model)));
      return products;
    }

    return null;
  }

  Future<ProductModel> getProductById(int id) async {
    var response = await _apiRequests.getProduct(id);

    if (response.statusCode == STATUS_SUCCESS) {
      final rawJson = jsonDecode(response.body);
      return ProductModel.fromJson(rawJson);
    }

    return null;
  }
}
