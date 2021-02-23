import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shoplustyle/controllers/all_products_page_controller.dart';
import 'package:shoplustyle/controllers/home_page_controller.dart';
import 'package:shoplustyle/models/category_model.dart';
import 'package:shoplustyle/utils/utils.dart';

class FiltersPageController extends GetxController {
  AllProductsPageController _controller;
  final HomePageController _homeController = Get.find();

  final String controllerId;

  FiltersPageController(this.controllerId);

  @override
  void onInit() {
    _controller = Get.find(tag: controllerId);
    setInitialFilters();
    super.onInit();
  }

  final _subCategories = List<CategoryModel>();

  var _selectedCategory = CategoryModel(id: -1, name: "همه", parent: 0).obs;
  var _selectedSubCategory = CategoryModel(id: -1, name: "همه", parent: 0).obs;
  var _subCategoryVisibility = false.obs;
  TextEditingController _minPriceController;
  TextEditingController _maxPriceController;

  String minPrice = "0";
  String maxPrice = "0";
  bool availableProducts = false;
  bool saleProducts = false;

  setInitialFilters() {
    final filters = _controller.filters;

    if (filters.containsKey("category")) {
      if (categoryExist(int.parse(filters["category"])))
        selectedCategory = findCategory(int.parse(filters["category"]));
      else {
        subCategoryVisibility = true;
        selectedSubCategory = findSubCategory(int.parse(filters["category"]));
        selectedCategory = findCategory(selectedSubCategory.parent);
      }
    }

    if (filters.containsKey("max_price")) maxPrice = filters["max_price"];

    if (filters.containsKey("min_price")) minPrice = filters["min_price"];

    if (filters.containsKey("in_stock")) availableProducts = true;

    if (filters.containsKey("on_sale")) saleProducts = true;
  }

  toggleAvailableProductsSwitch() {
    return (bool) {
      availableProducts = bool;
      update();
    };
  }

  toggleSaleProductsSwitch() {
    return (bool) {
      saleProducts = bool;
      update();
    };
  }

  get subCategories => _subCategories;

  set subCategories(value) {
    _subCategories.clear();
    _subCategories.addAll(value);
    update();
  }

  TextEditingController get minPriceController {
    if (int.parse(minPrice) > 0) {
      _minPriceController = TextEditingController(
          text: Utils.toPersianDigits(NumberFormat("###,000", "en-US")
              .format(int.parse(minPrice))
              .toString()));
    } else {
      _minPriceController = TextEditingController();
    }
    _minPriceController.addListener(() {
      String text = _minPriceController.text;
      text = text.replaceAll(",", "");
      text = Utils.toEnglishDigits(text);
      minPrice = text;
    });
    return _minPriceController;
  }

  TextEditingController get maxPriceController {
    if (int.parse(maxPrice) > 0) {
      _maxPriceController = TextEditingController(
          text: Utils.toPersianDigits(NumberFormat("###,000", "en-US")
              .format(int.parse(maxPrice))
              .toString()));
    } else {
      _maxPriceController = TextEditingController();
    }
    _maxPriceController.addListener(() {
      String text = _maxPriceController.text;
      text = text.replaceAll(",", "");
      text = Utils.toEnglishDigits(text);
      maxPrice = text;
      print(maxPrice);
    });
    return _maxPriceController;
  }

  get selectedCategory => _selectedCategory.value;

  set selectedCategory(value) {
    if (value.id == -1) {
      subCategoryVisibility = false;
    } else {
      subCategoryVisibility = true;
    }
    _selectedCategory.value = value;
  }

  get selectedSubCategory => _selectedSubCategory.value;

  set selectedSubCategory(value) {
    _selectedSubCategory.value = value;
  }

  get subCategoryVisibility => _subCategoryVisibility.value;

  set subCategoryVisibility(value) {
    _subCategoryVisibility.value = value;
  }

  List<CategoryModel> getSubCategories() {
    return _homeController.getSubCategories(selectedCategory.id);
  }

  VoidCallback applyFilters() {
    return () {
      sendFilters();
      closePage();
    };
  }

  VoidCallback clearFilters() {
    return () {
      closePage();
    };
  }

  VoidCallback closeFilters() {
    return () {
      closePage();
    };
  }

  sendFilters() {
    final filters = Map<String, String>();
    int categoryId;

    if (_selectedSubCategory.value.id > -1)
      categoryId = selectedSubCategory.id;
    else
      categoryId = selectedCategory.id;

    if (categoryId > -1) filters["category"] = categoryId.toString();

    if (saleProducts) filters["on_sale"] = "true";

    if (availableProducts) filters["in_stock"] = "true";

    if (int.parse(minPrice) > 0) {
      filters["min_price"] = minPrice;
    }

    if (int.parse(maxPrice) > 0) {
      filters["max_price"] = maxPrice;
    }

    _controller.setFilters(filters);
  }

  closePage() {
    Get.back();
  }

  GestureTapCallback categorySelectionHandler(selected) {
    return () {
      selectedCategory = selected;
      closePage();
    };
  }

  GestureTapCallback subCategorySelectionHandler(selected) {
    return () {
      selectedSubCategory = selected;
      closePage();
    };
  }

  bool categoryExist(int id) {
    for (final item in _homeController.categories) {
      if (item.id == id) return true;
    }
    return false;
  }

  CategoryModel findCategory(int id) {
    for (final item in _homeController.categories) {
      if (item.id == id) {
        return item;
      }
    }
    return null;
  }

  CategoryModel findSubCategory(int id) {
    for (final item in _homeController.subCategories) {
      if (item.id == id) {
        return item;
      }
    }
    return null;
  }

  @override
  void onClose() {
    _minPriceController.dispose();
    _maxPriceController.dispose();

    super.onClose();
  }
}
