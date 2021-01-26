import 'package:shoplustyle/utils/consts.dart';

class ApiClient {
  String _url = null;
  ApiClient(String basePath){
      _url = Consts.BASE_URL + basePath;
      oauth1();
  }

  void oauth1 () {
    if(_url.contains("?")){
      _url += "&consumer_key=";
    } else {
      _url += "?consumer_key=";
    }

    _url += Consts.WOOCOMMERCE_CONSUMER_KEY + "&consumer_secret=" + Consts.WOOCOMMERCE_CONSUMER_SECRET;
  }

  String getUrl() {
    return _url;
  }
}