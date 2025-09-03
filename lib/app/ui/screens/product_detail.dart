import 'package:e_commerce_app/core/app_icon_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../data/models/product_model.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ProductDetail extends StatelessWidget {
  final ProductModel product;
  const ProductDetail({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🖼️ Hero Image (fade + slide up)
            Hero(
              tag: "product_${product.name}",
              child: Image.asset(
                product.image,
                width: double.infinity,
                height: 300,
                fit: BoxFit.cover,
              ),
            )
                .animate()
                .fadeIn(duration: 600.ms)
                .slideY(begin: 0.2, end: 0, curve: Curves.easeOut),

            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Name + Price (depth zoom)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(product.name, style: textTheme.titleLarge)
                          .animate()
                          .fadeIn(duration: 500.ms)
                          .scale(begin: const Offset(0.8, 0.8), end: Offset(1, 1), curve: Curves.easeOutBack),
                      Text(
                        "\$${product.price}",
                        style: textTheme.titleLarge?.copyWith(
                          color: const Color(0xff6055d8),
                          fontWeight: FontWeight.bold,
                        ),
                      )
                          .animate(delay: 200.ms)
                          .fadeIn(duration: 500.ms)
                          .scale(begin: const Offset(1.2, 1.2), end: Offset(1, 1), curve: Curves.easeOut),
                    ],
                  ),
                  const SizedBox(height: 10),

                  /// Rating (slide from right)
                  Row(
                    children: [
                      SvgPicture.asset(AppIconAssets.star),
                      const SizedBox(width: 5),
                      Text("${product.rate} (${product.reviewCount} Reviews)"),
                    ],
                  )
                      .animate(delay: 400.ms)
                      .fadeIn(duration: 500.ms)
                      .slideX(begin: 0.4, end: 0, curve: Curves.easeOutBack),

                  const SizedBox(height: 15),

                  /// Description (fade + slide left)
                  Text("Description", style: textTheme.titleMedium)
                      .animate(delay: 600.ms)
                      .fadeIn(duration: 400.ms)
                      .slideX(begin: -0.3, end: 0),
                  const SizedBox(height: 5),
                  Text(product.description)
                      .animate(delay: 700.ms)
                      .fadeIn(duration: 600.ms)
                      .slideX(begin: -0.3, end: 0),

                  const SizedBox(height: 15),

                  /// Sizes (Drop-in effect)
                  if (product.sizes.isNotEmpty) ...[
                    Text("Sizes", style: textTheme.titleMedium)
                        .animate(delay: 900.ms)
                        .fadeIn(duration: 500.ms)
                        .slideY(begin: -0.2, end: 0),
                    const SizedBox(height: 10),
                    Row(
                      children: product.sizes.map((e) {
                        final index = product.sizes.indexOf(e);
                        return Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Container(
                            width: 44,
                            height: 44,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Colors.grey.shade400,
                              ),
                            ),
                            child: Text(
                              e.size.toString(),
                              style: textTheme.bodyMedium?.copyWith(
                                color: e.isAvailable
                                    ? Colors.black
                                    : Colors.grey,
                              ),
                            ),
                          )
                              .animate(delay: (1000 + index * 180).ms)
                              .fadeIn(duration: 400.ms)
                              .slideY(begin: -0.5, end: 0, curve: Curves.bounceOut),
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
    );
  }
}
