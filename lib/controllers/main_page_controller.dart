import 'package:get/get.dart';
import 'package:shoplustyle/controllers/home_page_controller.dart';
import 'package:shoplustyle/models/slider_item_model.dart';

class MainPageController extends GetxController {
  // final HomePageController homeController = Get.find();

  final _sliders = List<SliderItemModel>();

  get sliders => _sliders;

  set sliders(value) {
    _sliders.addAll(value);
  }

  // String getAllCategoriesProductsCount() {
  //   int count = 0;
  //
  //   for (var item in homeController.categories) {
  //     if (item.id != -1) {
  //       count += item.count;
  //     }
  //   }
  //
  //   return count.toString() + " مورد";
  // }
}
