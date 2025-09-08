import 'package:e_commerce_app/app/ui/theme/app_colors.dart';
import 'package:e_commerce_app/app/ui/theme/app_text_styles.dart';
import 'package:e_commerce_app/app/ui/widgets/circle_icon_button.dart';
import 'package:e_commerce_app/app/ui/widgets/product_size.dart';
import 'package:e_commerce_app/app/ui/widgets/rounded_button.dart';
import 'package:e_commerce_app/core/resources/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../data/models/product_model.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../theme/app_spacing.dart';

class ProductDetail extends StatelessWidget {
  final ProductModel product;
  const ProductDetail({super.key, required this.product});

  @override
  Widget build(BuildContext context) {

    final topPadding = MediaQuery.paddingOf(context).top;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Hero Image
            Hero(
                tag: "product_${product.name}",
                child: Container(
                  width: double.infinity,
                  height: 300,
                  padding: EdgeInsets.symmetric(
                      vertical: topPadding, horizontal: 15),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage(
                      product.image,
                    ),
                    fit: BoxFit.cover,
                  )),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleIconButton(
                        icon: Icons.keyboard_arrow_left_outlined,
                        iconColor: AppColors.black,
                        backgroundColor: AppColors.secondary,
                        onPressed: () => Get.back(),
                      ),
                      CircleIconButton(
                        icon: product.isFavourite
                            ? Icons.favorite
                            : Icons.favorite_border,
                        iconColor: AppColors.black,
                        backgroundColor: AppColors.secondary,
                        onPressed: () {},
                      )
                    ],
                  ),
                )),

            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 10,
                children: [
                  /// Name + Price
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(product.name, style: AppTextStyles.headingLarge)
                          .animate()
                          .fadeIn(duration: 500.ms)
                          .scale(
                              begin: const Offset(0.8, 0.8),
                              end: const Offset(1, 1),
                              curve: Curves.easeOutBack),
                      Text(
                        "\$${product.price}",
                        style: AppTextStyles.headlineSmall.copyWith(
                          color: const Color(0xff6055d8),
                        ),
                      ).animate(delay: 200.ms).fadeIn(duration: 500.ms).scale(
                          begin: const Offset(1.2, 1.2),
                          end: const Offset(1, 1),
                          curve: Curves.easeOut),
                    ],
                  ),

                  /// Rating
                  Row(
                    children: [
                      SvgPicture.asset(AppIcons.star),
                      const SizedBox(width: 5),
                      Text(
                        "${product.rate}",
                        style: AppTextStyles.labelLarge,
                      ),
                      Text(
                        " (${product.reviewCount} Reviews)",
                        style: AppTextStyles.labelLarge.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  )
                      .animate(delay: 400.ms)
                      .fadeIn(duration: 500.ms)
                      .slideX(begin: 0.4, end: 0, curve: Curves.easeOutBack),

                  const SizedBox(height: AppSpacing.sm),

                  /// Description
                  const Text("Description", style: AppTextStyles.headingMedium)
                      .animate(delay: 600.ms)
                      .fadeIn(duration: 400.ms)
                      .slideX(begin: -0.3, end: 0),

                  Text(
                    product.description,
                    style: AppTextStyles.displayMedium,
                  )
                      .animate(delay: 700.ms)
                      .fadeIn(duration: 600.ms)
                      .slideX(begin: -0.3, end: 0),

                  const SizedBox(height: AppSpacing.sm),

                  /// Sizes
                  if (product.sizes.isNotEmpty) ...[
                    const Text("Sizes", style: AppTextStyles.headingMedium)
                        .animate(delay: 900.ms)
                        .fadeIn(duration: 500.ms)
                        .slideY(begin: -0.2, end: 0),

                    Row(
                      children: product.sizes.map((e) {
                        final index = product.sizes.indexOf(e);
                        return Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: ProductSize(item: e)
                              .animate(delay: (1000 + index * 180).ms)
                              .fadeIn(duration: 400.ms)
                              .slideY(
                                  begin: -0.5, end: 0, curve: Curves.bounceOut),
                        );
                      }).toList(),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          height: 50,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 15,
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                  ),
                  child: const Text("Buy Now"),
                ),
              ),
              RoundedButton(
                onPressed: () {},
                backgroundColor: AppColors.secondary,
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: SvgPicture.asset(
                  AppIcons.cart,
                  colorFilter: const ColorFilter.mode(
                    AppColors.grey,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
