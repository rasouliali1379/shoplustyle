import 'package:get/get.dart';
import 'package:shoplustyle/local_db/basket_db.dart';
import 'package:shoplustyle/models/products_model.dart';
import 'package:shoplustyle/models/slider_item_model.dart';
import 'package:shoplustyle/pages/product_page.dart';

class MainPageController extends GetxController {


  ProductModel openProduct;

  int selectedCategoryId = -1;
  int _allProductPageId = 0;

  final _sliders = List<SliderItemModel>();

  ProductModel selectedProduct;

  var _basketItemsCount = 0.obs;

  final _basketDB = BasketDB();



  @override
  void onInit() {
    _basketDB.initializeDatabase();
    super.onInit();
  }

  @override
  void onReady() {
    reloadBasket();
    super.onReady();
  }


  get basketItemsCount => _basketItemsCount.value;

  set basketItemsCount(value) {
    _basketItemsCount.value = value;
  }

  get sliders => _sliders;

  set sliders(value) {
    _sliders.addAll(value);
  }

  openProductPage(ProductModel product) {
    return () {
      if(product.parentId == 0)
        Get.to(ProductPage(product), preventDuplicates: false);
    };
  }

  int get allProductPageId => _allProductPageId++;

  reloadBasket() async {
    final basketItems = await _basketDB.getBasketContent();
    int count = 0;
    for(final item in basketItems){
      count += item["quantity"];
      print(item.length);
    }
    basketItemsCount = count;
  }

  openBasket(){
    return (){
      Get.toNamed("/basket_page");
    };
  }
}
