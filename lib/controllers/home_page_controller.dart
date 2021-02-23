import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoplustyle/controllers/main_page_controller.dart';
import 'package:shoplustyle/models/category_model.dart';
import 'package:shoplustyle/repository/category_repository.dart';
import 'package:shoplustyle/utils/consts.dart';
import 'package:shoplustyle/widgets/custom_slider_item.dart';

class HomePageController extends GetxController {
  final MainPageController mainController = Get.find();

  var _sliderIndex = 0.obs;
  var lastScrollPosition = 0.0;
  ScrollController _scrollController;
  var _pageStatus = STATUS_LOADING;
  int pageNum = 1;
  List<Widget> _carouselItems;

  var _categories = List<CategoryModel>().obs;
  List<CategoryModel> subCategories;

  final GlobalKey<RefreshIndicatorState> refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  get sliderIndex => _sliderIndex.value;

  set sliderIndex(value) {
    _sliderIndex.value = value;
  }

  List<Widget> get carouselItems {
    if (_carouselItems == null) {
      carouselSliderWidgets();
    }

    return _carouselItems;
  }

  set carouselItems(List<Widget> value) {
    _carouselItems = value;
  }

  get categories {
    if (_categories.length == 0) {
      refreshIndicatorKey.currentState.show();
      return null;
    }
    return _categories;
  }

  set categories(List<CategoryModel> list) {
    _categories.addAll(list);
  }

  get pageStatus => _pageStatus;

  set pageStatus(value) {
    _pageStatus = value;
    update();
  }

  get scrollController {
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      //Reach Bottom
      if (_scrollController.offset >=
              _scrollController.position.maxScrollExtent &&
          !_scrollController.position.outOfRange) {
        // requestPermitted = false;
        // requestCategories();
      }

      //Reach Top
      if (_scrollController.offset <=
              _scrollController.position.minScrollExtent &&
          !_scrollController.position.outOfRange) {}
    });

    return _scrollController;
  }

  Future<void> requestAllCategories() async {
    final allCategories = await CategoryRepository().getAllCategories();
    separateCategories(allCategories);
  }

  void separateCategories(List<CategoryModel> list) {
    final _allCategory = List<CategoryModel>();
    _allCategory.add(CategoryModel(id: -1, name: "همه", parent: 0));
    final _allSubCategory = List<CategoryModel>();

    for (final item in list) {
      if (item.parent == 0)
        _allCategory.add(item);
      else
        _allSubCategory.add(item);
    }

    categories = _allCategory;
    subCategories = _allSubCategory;
  }

  refreshPage() {
    _categories.clear();
    _carouselItems = null;
    sliderIndex = 0;
    pageNum = 1;
    pageStatus = STATUS_LOADING;
    return requestAllCategories().then((_) => pageStatus = STATUS_SUCCESSFUL);
  }

  GestureTapCallback openAllProducts(int categoryId) {
    return () {
      mainController.selectedCategoryId = categoryId;
      Get.toNamed("/all_products_page");
    };
  }

  void carouselSliderWidgets() {
    carouselItems = List<Widget>.from(
        mainController.sliders.map((item) => CustomSliderItem(item)).toList());
  }

  List<CategoryModel> getPureCategories() {
    if (categories != null) {
      final pureCategories = List<CategoryModel>();
      pureCategories.addAll(categories);
      pureCategories.removeAt(0);
      return pureCategories;
    }
    return null;
  }

  String getAllCategoriesProductsCount(bool subCategory, int parentId) {
    int count = 0;
    if (subCategory) {
      for (var item in subCategories) {
        if (item.id > -1 && item.parent == parentId) {
          count += item.count;
        }
      }
    } else {
      for (var item in categories) {
        if (item.id > -1) {
          count += item.count;
        }
      }
    }

    return count.toString() + " مورد";
  }

  List<CategoryModel> getSubCategories(int parentId){
    final _subCategories = List<CategoryModel>();
    _subCategories.add(CategoryModel(id: -1, name: "همه", parent: 0));
    for(final item in subCategories){
      if(item.parent == parentId)
        _subCategories.add(item);
    }

    return _subCategories;
  }


}
