import 'package:e_commerce_app/app/routing/app_routes.dart';
import 'package:e_commerce_app/app/ui/theme/app_spacing.dart';
import 'package:e_commerce_app/app/ui/theme/app_text_styles.dart';
import 'package:e_commerce_app/app/ui/widgets/circle_icon_button.dart';
import 'package:e_commerce_app/app/ui/widgets/search_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/resources/app_images.dart';
import '../../controllers/home_controller.dart';
import '../theme/app_colors.dart';
import '../widgets/carousel_slider_item.dart';
import '../widgets/home_list_item.dart';
import 'package:flutter_animate/flutter_animate.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        title: const Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Row(
            spacing: 10,
            children: [
              CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage(AppImages.userProfile),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Hello!',
                    style: AppTextStyles.bodySmall,
                  ),
                  Text(
                    'John William',
                    style: AppTextStyles.headlineSmall,
                  )
                ],
              )
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: CircleIconButton(
              icon: Icons.notifications,
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchTextField(controller: controller.searchTextController),

              const SizedBox(height: AppSpacing.lg),

              /// Carousel
              CarouselSliderItem()
                  .animate()
                  .fadeIn(duration: 600.ms)
                  .slideY(begin: -0.2, end: 0),

              const SizedBox(height: AppSpacing.lg),

              /// Featured Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Featured", style: AppTextStyles.headingMedium),
                  TextButton(
                    onPressed: () => Get.toNamed(AppRoutes.products),
                    child: Text(
                      "See All",
                      style: AppTextStyles.labelMedium.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ],
              )
                  .animate(delay: 300.ms) // appears after carousel
                  .fadeIn(duration: 500.ms)
                  .slideX(begin: -0.2, end: 0),

              /// Featured List
              SizedBox(
                height: 155,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.featuredList.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 16),
                  itemBuilder: (_, i) => HomeListItem(
                    item: controller.featuredList[i],
                  )
                      .animate(delay: (500 + i * 150).ms) // sequential per item
                      .fadeIn(duration: 400.ms)
                      .scale(begin: const Offset(0.8, 0.8), end: const Offset(1, 1)),
                ),
              ),

              const SizedBox(height: AppSpacing.lg),

              /// Popular Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Most Popular",
                      style: AppTextStyles.headingMedium),
                  TextButton(
                    onPressed: () => Get.toNamed(AppRoutes.products),
                    child: Text(
                      "See All",
                      style: AppTextStyles.labelMedium.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ],
              )
                  .animate(delay: 1000.ms) // appears after featured section
                  .fadeIn(duration: 500.ms)
                  .slideX(begin: 0.2, end: 0),

              /// 5. Popular List
              SizedBox(
                height: 155,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.popularList.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 16),
                  itemBuilder: (_, i) => HomeListItem(
                    item: controller.popularList[i],
                  )
                      .animate(
                          delay: (1200 + i * 150).ms) // sequential per item
                      .fadeIn(duration: 400.ms)
                      .scale(begin: const Offset(0.8, 0.8), end: const Offset(1, 1)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
