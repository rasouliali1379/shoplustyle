import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:shoplustyle/controllers/home_page_controller.dart';
import 'package:shoplustyle/utils/consts.dart';

final aspectRatio = 4 / 3;

final HomePageController _controller = Get.find();

class CustomSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CarouselSlider(
        items: _controller.carouselItems,
        options: CarouselOptions(
            autoPlay: true,
            enlargeCenterPage: true,
            viewportFraction: 1,
            aspectRatio: aspectRatio,
            onPageChanged: (index, _) => _controller.sliderIndex = index),
      ),
      GetX<HomePageController>(
          builder: (controller) => sliderDots(controller.sliderIndex))
    ]);
  }

  Widget sliderDots(int current) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _controller.carouselItems.map((url) {
        int index = _controller.carouselItems.indexOf(url);
        return Container(
          width: 8.0,
          height: 8.0,
          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: current == index
                ? PRIMARY_LIGHT
                : PRIMARY_LIGHT.withOpacity(0.4),
          ),
        );
      }).toList(),
    );
  }
}
