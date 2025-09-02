import 'package:e_commerce_app/core/app_icon_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../data/models/product_model.dart';

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
            Hero(
              tag: "product_${product.name}",
              child: Image.asset(
                product.image,
                width: double.infinity,
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Name + Price
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(product.name, style: textTheme.titleLarge),
                      Text(
                        "\$${product.price}",
                        style: textTheme.titleLarge?.copyWith(
                          color: const Color(0xff6055d8),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  /// Rating
                  Row(
                    children: [
                      SvgPicture.asset(AppIconAssets.star),
                      const SizedBox(width: 5),
                      Text("${product.rate} (${product.reviewCount} Reviews)"),
                    ],
                  ),
                  const SizedBox(height: 15),

                  /// Description
                  Text("Description", style: textTheme.titleMedium),
                  const SizedBox(height: 5),
                  Text(product.description),
                  const SizedBox(height: 15),

                  /// Sizes
                  if (product.sizes.isNotEmpty) ...[
                    Text("Sizes", style: textTheme.titleMedium),
                    const SizedBox(height: 10),
                    Row(
                      children: product.sizes.map((e) {
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
                          ),
                        );
                      }).toList(),
                    ),
                  ]
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

