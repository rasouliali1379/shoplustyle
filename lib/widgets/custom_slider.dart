import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:shoplustyle/controllers/slider_controller.dart';
import 'package:shoplustyle/utils/consts.dart';
import 'package:shoplustyle/widgets/custom_slider_item.dart';

final aspectRatio = 4 / 3;

final SliderController sliderController = Get.find();
final loadItems = List<Widget>.from(sliderController.imageList
    .map((item) => CustomSliderItem(item))
    .toList());

class CustomSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CarouselSlider(
        items: loadItems,
        options: CarouselOptions(
            autoPlay: true,
            initialPage: sliderController.slide,
            enlargeCenterPage: true,
            viewportFraction: 1,
            aspectRatio: aspectRatio,
            onPageChanged: (index, _) => sliderController.slide = index),
      ),
      GetBuilder<SliderController>(
          builder: (controller) => sliderDots(controller.slide))
    ]);
  }

  Widget sliderDots(int current) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: loadItems.map((url) {
        int index = loadItems.indexOf(url);
        return Container(
          width: 8.0,
          height: 8.0,
          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: current == index
                ? Consts.PRIMARY_LIGHT
                : Consts.PRIMARY_LIGHT.withOpacity(0.4),
          ),
        );
      }).toList(),
    );
  }
}
