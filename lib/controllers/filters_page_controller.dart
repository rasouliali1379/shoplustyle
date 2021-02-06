import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoplustyle/models/category_model.dart';

class FiltersPageController extends GetxController {
  var _selectedCategory = CategoryModel(id: -1, name: "همه").obs;
  var _selectedSubCategory = CategoryModel(id: -1, name: "همه").obs;
  var _subCategoryVisibility = false.obs;

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

  VoidCallback applyFilters() {
    return () {
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

  closePage() {
    Get.back();
  }

  GestureTapCallback categorySelectionHandler(selected) {
    return () {
      selectedCategory = selected;
      print(selected.toString());
      closePage();
    };
  }

  GestureTapCallback subCategorySelectionHandler(selected) {
    return () {
      selectedSubCategory = selected;
      print(selected.toString());
      closePage();
    };
  }
}
