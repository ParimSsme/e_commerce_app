import 'package:e_commerce_app/app/controllers/home_controller.dart';
import 'package:e_commerce_app/app/ui/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../../core/resources/app_images.dart';
import '../theme/app_colors.dart';

class CarouselSliderItem extends StatelessWidget {
  CarouselSliderItem({super.key});

  final HomeController carouselCtrl = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
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
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      spacing: 5,
                      children: [
                        Text(
                          'Get Winter Discount',
                          style: AppTextStyles.headlineSmall.copyWith(
                            color: AppColors.onPrimary,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          '20% Off',
                          style: AppTextStyles.headingLarge.copyWith(
                            color: AppColors.onPrimary,
                          ),
                        ),
                        Text(
                          'For Children',
                          style: AppTextStyles.headlineSmall.copyWith(
                            color: AppColors.onPrimary,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    Image.asset(
                      AppImages.sliderBoy,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(4, (index) {
              return Container(
                width: 12,
                height: 12,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: carouselCtrl.currentCarouselIndex.value == index
                      ? AppColors.primary
                      : AppColors.secondary,
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
