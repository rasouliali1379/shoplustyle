import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:shoplustyle/network/api_client.dart';

class ApiRequests{

  ApiClient _apiClient;

  Future<Response> getBanners() async{
    _apiClient = ApiClient("api/AndroidAppSettings/android_get_all_banners?insecure=cool");
    var response = await http.get(_apiClient.getUrl());
    return response;
  }

  Future<Response> getAllProducts() async{
    _apiClient = ApiClient("wp-json/wc/v2/products");
    var response = await http.get(_apiClient.getUrl());
    return response;
  }

}