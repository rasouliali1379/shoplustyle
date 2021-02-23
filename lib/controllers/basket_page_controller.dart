import 'package:get/get.dart';
import 'package:shoplustyle/controllers/main_page_controller.dart';
import 'package:shoplustyle/local_db/basket_db.dart';
import 'package:shoplustyle/models/products_model.dart';
import 'package:shoplustyle/repository/products_repository.dart';

class BasketPageController extends GetxController {
  final _basketItems = List<Map<String, dynamic>>();
  final MainPageController mainController = Get.find();
  final _basketDB = BasketDB();
  final _totalPrice = "".obs;

  @override
  void onInit() {
    _basketDB.initializeDatabase();
    super.onInit();
  }

  @override
  void onReady() {
    loadBasketItems();
    calculateTotalPrice();
    super.onReady();
  }

  get totalPrice => _totalPrice.value;

  set totalPrice(value) {
    _totalPrice.value = value;
  }

  get basketItems => _basketItems;

  set basketItems(value) {
    _basketItems.addAll(value);
    update();
  }



  Future<ProductModel> getProduct(int id) async {
    final product = await ProductRepository().getProductById(id);
    return product;
  }

  calculateTotalPrice() {}

  loadBasketItems() async {
    basketItems = await _basketDB.getBasketContent();
  }

  closePage() {
    return () => Get.back();
  }
}
