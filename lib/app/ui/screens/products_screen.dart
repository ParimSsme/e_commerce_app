import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/products_controller.dart';
import '../widgets/product_list_item.dart';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductsController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Products")
            .animate()
            .fadeIn(duration: 500.ms)
            .slideY(begin: -0.3, end: 0),
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(15),
        itemCount: controller.products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 17,
          crossAxisSpacing: 25,
          childAspectRatio: 1 / 1.1,
        ),
        itemBuilder: (_, i) {
          final product = controller.products[i];
          return ProductListItem(
            item: product,
            onFavouriteToggle: () => controller.toggleFavourite(i),
          )
              .animate(delay: (120 * i).ms) // staggered like search screen
              .fadeIn(duration: 500.ms)
              .scale(begin: const Offset(0.6, 0.6), end: Offset(1, 1), duration: 600.ms, curve: Curves.easeOutBack)
              .flipV(begin: -0.5, end: 0, duration: 700.ms, curve: Curves.easeOut);
        },
      )
          .animate(delay: 300.ms)
          .fadeIn(duration: 600.ms),
    );
  }
}




