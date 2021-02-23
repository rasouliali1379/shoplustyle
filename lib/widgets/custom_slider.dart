import 'package:dots_indicator/dots_indicator.dart';
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
      sliderDots()
    ]);
  }

  Widget sliderDots() {
    return GetX<HomePageController>(
      builder: (controller) => DotsIndicator(
        dotsCount: controller.carouselItems.length,
        position: controller.sliderIndex.toDouble(),
        decorator: DotsDecorator(
            color: PRIMARY_LIGHT.withOpacity(0.4), // Inactive color
            activeColor: PRIMARY_LIGHT,
            spacing: EdgeInsets.only(top: 4, left: 2, right: 2,bottom: 16)),
      ),
    );
  }
}
