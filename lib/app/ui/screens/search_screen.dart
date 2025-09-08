import 'package:e_commerce_app/app/ui/theme/app_spacing.dart';
import 'package:e_commerce_app/app/ui/widgets/search_text_field.dart';
import 'package:flutter/material.dart' hide SearchController;
import 'package:get/get.dart';
import '../../controllers/search_controller.dart';
import '../../routing/app_routes.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../widgets/search_product_item.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SearchScreen extends GetView<SearchController> {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 25,
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: IconButton(
            onPressed: () => Get.back(),
            padding: const EdgeInsets.only(left: 5.0),
            icon: const Icon(Icons.arrow_back_ios, size: 24.0),
          ).animate().fadeIn(duration: 400.ms).slideX(begin: -0.3, end: 0),
        ),
        title: SearchTextField(
          controller: controller.searchTextController,
          onChanged: controller.filterProducts,
        )
            .animate(delay: 200.ms)
            .fadeIn(duration: 400.ms)
            .slideY(begin: -0.2, end: 0),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: IconButton(
              onPressed: () => Get.toNamed(AppRoutes.filters),
              icon: const Icon(
                Icons.tune,
                size: 24,
                color: Colors.black87,
              ),
            )
                .animate(delay: 300.ms)
                .fadeIn(duration: 400.ms)
                .slideX(begin: 0.3, end: 0),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            spacing: AppSpacing.md,
            children: [
              ValueListenableBuilder<TextEditingValue>(
                valueListenable: controller.searchTextController,
                builder: (context, value, _) {
                  return AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    transitionBuilder: (child, animation) {
                      return FadeTransition(opacity: animation, child: child);
                    },
                    child: value.text.isEmpty
                        ? const SizedBox.shrink(key: ValueKey('empty'))
                        : Row(
                            key: const ValueKey('textRow'),
                            children: [
                              Text(
                                'Results for ',
                                style: AppTextStyles.headingMedium.copyWith(
                                  color: AppColors.textSecondary,
                                ),
                              ),
                              Text(
                                '"${value.text}"',
                                style: AppTextStyles.headingMedium,
                              ),
                              const Spacer(),
                              Text(
                                '${controller.filteredProducts.length} Results Found',
                                style: AppTextStyles.headlineSmall.copyWith(
                                  color: AppColors.primary,
                                ),
                              ),
                            ],
                          ),
                  );
                },
              ),
              Expanded(
                child: Obx(
                  () => GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 17,
                      crossAxisSpacing: 25,
                      childAspectRatio: 1 / 1.1,
                    ),
                    padding: const EdgeInsets.all(0),
                    itemCount: controller.filteredProducts.length,
                    itemBuilder: (_, index) {
                      return SearchProductItem(
                              item: controller.filteredProducts[index])
                          .animate(delay: (120 * index).ms)
                          .fadeIn(duration: 500.ms)
                          .scale(
                              begin: const Offset(0.6, 0.6),
                              end: const Offset(1, 1),
                              duration: 600.ms,
                              curve: Curves.easeOutBack)
                          .flipV(
                              begin: -0.5,
                              end: 0,
                              duration: 700.ms,
                              curve: Curves.easeOut);
                    },
                  ).animate(delay: 300.ms).fadeIn(duration: 600.ms),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
