import 'package:e_commerce_app/app/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../../core/app_image_assets.dart';

class CarouselSliderItem extends StatelessWidget {
  CarouselSliderItem({super.key});

  final HomeController carouselCtrl = Get.find();

  final List<String> imgList = [
    "https://picsum.photos/400/200",
    "https://picsum.photos/401/200",
    "https://picsum.photos/402/200",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: imgList
              .map((img) => ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child:  Container(
              margin: const EdgeInsets.all(5.0),
              decoration: const BoxDecoration(
                color: Color(0xff6055d8),
              ),
              child: Row(
                children: [
                  const Column(
                    children: [
                      Text('Get Winter Discount'),
                      Text('20% Off'),
                      Text('For Children'),
                    ],
                  ),
                  Image.asset(AppImageAssets.sliderBoy),
                ],
              ),
            ),
          ))
              .toList(),
          options: CarouselOptions(
            autoPlay: true,
            aspectRatio: 2.0,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) =>
                carouselCtrl.changeIndex(index),
          ),
        ),
        const SizedBox(height: 10),
        Obx(() => Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imgList.asMap().entries.map((entry) {
            return Container(
              width: 12,
              height: 12,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: carouselCtrl.currentCarouselIndex.value == entry.key
                    ? Colors.deepPurple
                    : Colors.grey,
              ),
            );
          }).toList(),
        )),
      ],
    );
  }
}
