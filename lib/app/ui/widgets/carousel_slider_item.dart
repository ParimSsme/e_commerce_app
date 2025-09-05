import 'package:e_commerce_app/app/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../../core/app_image_assets.dart';

class CarouselSliderItem extends StatelessWidget {
  CarouselSliderItem({super.key});

  final HomeController carouselCtrl = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 200,
            autoPlay: true,
            viewportFraction: 1,
            aspectRatio: 16 / 9,
            enlargeCenterPage: true,
            enlargeStrategy: CenterPageEnlargeStrategy.scale,
          ),
          items: List.generate(4, (index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                // margin: const EdgeInsets.all(5.0),
                decoration: const BoxDecoration(
                  color: Color(0xff6055d8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Get Winter Discount',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        SizedBox(height: 5),
                        Text(
                          '20% Off',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'For Children',
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ],
                    ),
                    Image.asset(
                      AppImageAssets.sliderBoy,
                      height: 120,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
        const SizedBox(height: 10),
        Obx(() => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(4, (index) {
                return Container(
                  width: 12,
                  height: 12,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: carouselCtrl.currentCarouselIndex.value == index
                        ? Colors.deepPurple
                        : Colors.grey,
                  ),
                );
              }),
            )),
      ],
    );
  }
}
