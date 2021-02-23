import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoplustyle/controllers/main_page_controller.dart';
import 'package:shoplustyle/local_db/basket_db.dart';
import 'package:shoplustyle/modals/variations_modal.dart';
import 'package:shoplustyle/models/products_model.dart';
import 'package:shoplustyle/repository/products_repository.dart';
import 'package:shoplustyle/utils/consts.dart';
import 'package:shoplustyle/utils/utils.dart';
import 'package:shoplustyle/widgets/custom_product_carousel_item.dart';

class ProductPageController extends GetxController {
  final ProductModel openProduct;

  ProductPageController(this.openProduct);

  final _basketDB = BasketDB();

  final MainPageController mainController = Get.find();

  List<Widget> _carouselItems;

  var _buyBtnStatus = STATUS_BUY.obs;

  var _currentSlide = 0.obs;

  var _selectedProductId = 0.obs;

  var quantity = 1.obs;

  @override
  void onInit() {
    buyBtnStatus = STATUS_LOADING;
    _basketDB.initializeDatabase().then((_) => buyBtnStatus = STATUS_BUY);
    super.onInit();
  }

  get selectedProductId => _selectedProductId.value;

  set selectedProductId(value) {
    _selectedProductId.value = value;
  }

  get buyBtnStatus => _buyBtnStatus.value;

  set buyBtnStatus(value) {
    _buyBtnStatus.value = value;
  }

  List<Widget> get carouselItems {
    if (_carouselItems == null) {
      _carouselItems = List<Widget>.from(openProduct.images
          .map((item) => CustomProductCarouselItem(item.src))
          .toList());
    }

    return _carouselItems;
  }

  set carouselItems(List<Widget> value) {
    _carouselItems = value;
  }

  get currentSlide => _currentSlide.value;

  set currentSlide(value) {
    _currentSlide.value = value;
  }

  openAllProducts(int categoryId) {
    return () {
      mainController.selectedCategoryId = categoryId;
      Get.toNamed("/all_products_page");
    };
  }

  closePage() {
    return () => Get.back();
  }

  String getReviewStatus() {
    if (openProduct.ratingCount > 0) {
      if (openProduct.ratingCount == 1) {
        return "یک نظر";
      } else {
        return openProduct.ratingCount.toString() + " نظر";
      }
    } else {
      return "بدون نظر";
    }
  }

  addProductToBasket(context) {
    return () async {
      if (openProduct.type == "variable") {
        buyBtnStatus = STATUS_LOADING;
        await ProductRepository()
            .getProductVariations(openProduct.id)
            .then((value) {
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) => VariationsModal(
                  "متغیر های محصول", value, variationClickHandler));
          buyBtnStatus = STATUS_SUCCESSFUL;
        });
      } else {
        insertProductToBasket(openProduct.id);
      }
    };
  }

  insertProductToBasket(int id) async {
    await _basketDB.insertProduct({"id": id.toString(), "quantity": "1"}).then(
        (_) => mainController.reloadBasket());
    selectedProductId = id;
  }

  variationClickHandler(selected) {
    return () {
      insertProductToBasket(selected);
      Get.back();
    };
  }

  increaseQuantity() {
    return () async {
      buyBtnStatus = STATUS_LOADING;
      quantity.value++;
      await _basketDB.updateProduct(
          {"id": selectedProductId, "quantity": quantity.value}).then((_) {
        buyBtnStatus = STATUS_BUY;
        mainController.reloadBasket();
      });
    };
  }

  decreaseQuantity() {
    return () async {
      if (quantity.value > 1) {
        buyBtnStatus = STATUS_LOADING;
        quantity.value--;
        await _basketDB.updateProduct(
            {"id": selectedProductId, "quantity": quantity.value}).then((_) {
          buyBtnStatus = STATUS_BUY;
          mainController.reloadBasket();
        });
      } else {
        buyBtnStatus = STATUS_LOADING;
        await _basketDB.delete(selectedProductId).then((_) {
          selectedProductId = 0;
          buyBtnStatus = STATUS_BUY;
          mainController.reloadBasket();
        });
      }
    };
  }

  Future<List<ProductModel>> getRelatedProducts() async {
    final Map<String, String> filters = {
      "include": Utils.mergeIntArrayItems(openProduct.relatedIds, ","),
    };

    return await ProductRepository().getProductsById(filters);
  }
}
