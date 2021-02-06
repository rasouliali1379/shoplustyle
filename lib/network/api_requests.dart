import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:shoplustyle/network/api_client.dart';
import 'package:shoplustyle/utils/utils.dart';

class ApiRequests{

  ApiClient _apiClient;

  Future<Response> getBanners() async{
    _apiClient = ApiClient("api/AndroidAppSettings/android_get_all_banners?insecure=cool");
    var response = await http.get(_apiClient.getUrl());
    return response;
  }

  Future<Response> getProducts(Map<String, String> map) async{
    _apiClient = ApiClient("wp-json/wc/v2/products");
    var response = await http.get(_apiClient.getUrl() + Utils.queryBuilder(map));
    return response;
  }

  Future<Response> getProductVariations(int id) async{
    _apiClient = ApiClient("wp-json/wc/v2/products/${id.toString()}/variations");
    var response = await http.get(_apiClient.getUrl());
    return response;
  }

  Future<Response> getCategories(Map<String, String> map) async{
    _apiClient = ApiClient("wp-json/wc/v2/products/categories");
    var response = await http.get(_apiClient.getUrl()  + Utils.queryBuilder(map));
    return response;
  }
}