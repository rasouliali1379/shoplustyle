import 'package:get/get.dart';
import 'package:shoplustyle/controllers/main_page_controller.dart';
import 'package:shoplustyle/repository/slider_repository.dart';

class SplashPageController extends GetxController {
  final MainPageController _controller = Get.find();
  @override
  void onInit() {
    getSliders();
    super.onInit();
  }

  getSliders() async {
    var _sliders = await SliderRepository().getSliders();

    if (_sliders != null) {
      _controller.sliders = _sliders;
      Get.offNamed("/main_page");
    }
  }

}
