import 'package:get/get.dart';
import 'package:shoplustyle/controllers/bottom_nav_controller.dart';
import 'package:shoplustyle/controllers/home_page_controller.dart';
import 'package:shoplustyle/controllers/main_page_controller.dart';

class MainPageBinding implements Bindings{
  @override
  void dependencies() {
    Get.put<MainPageController>(MainPageController(), permanent: true);
    Get.put<HomePageController>(HomePageController());
    Get.put<NavController>(NavController());
  }
}