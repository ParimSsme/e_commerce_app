import 'package:e_commerce_app/core/app_icon_assets.dart';
import 'package:e_commerce_app/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductDetail extends StatelessWidget {
  final ProductModel product;
  const ProductDetail({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset(
            product.image,
            width: double.infinity,
            height: 401,
            fit: BoxFit.fill,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(product.name),
                        Row(
                          children: [
                            SvgPicture.asset(AppIconAssets.star),
                            Text(product.rate.toString()),
                            Text('( ${product.reviewCount} Review)'),
                          ],
                        )
                      ],
                    ),
                    Text('\$${product.price}')
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text('Description'),
                Text(product.description),
                const SizedBox(
                  height: 15,
                ),
                const Text('Size'),
                Row(
                  children: product.sizes
                      .map(
                        (e) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: SizedBox(
                            width: 44,
                            height: 44,
                            child: Stack(
                              // alignment: Alignment.center,
                              children: [
                                if (!e.isAvailable)
                                  Positioned(
                                    left: 2.5,
                                    bottom: 1.8,
                                    child: SvgPicture.asset(AppIconAssets.line),
                                  ),
                                Container(
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
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall
                                        ?.copyWith(
                                          color: e.isAvailable
                                              ? Colors.black
                                              : Colors.grey,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),

              ],
            ),
          )
        ],
      ),
    );
  }
}
