import 'package:e_commerce_app/app/ui/widgets/circle_icon_button.dart';
import 'package:flutter/material.dart';
import '../../controllers/cart_controller.dart';
import '../../routing/app_routes.dart';
import 'package:get/get.dart';
import '../widgets/cart_item.dart';
import '../widgets/order_summary.dart';
import 'package:flutter_animate/flutter_animate.dart';

class CartScreen extends GetView<CartController> {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: CircleIconButton(
            iconSize: 30,
            onPressed: Get.back,
            icon: Icons.arrow_back,
          ).animate().fadeIn(duration: 400.ms).slideX(begin: -0.3, end: 0),
        ),
        title: const Text('Cart')
            .animate(delay: 200.ms)
            .fadeIn(duration: 500.ms)
            .slideY(begin: -0.2, end: 0),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: CircleIconButton(
              iconSize: 30,
              onPressed: controller.onMenuPressed,
              icon: Icons.more_vert,
            )
                .animate(delay: 300.ms)
                .fadeIn(duration: 400.ms)
                .slideX(begin: 0.3, end: 0),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              /// Cart Items List
              SizedBox(
                height: height * 0.44,
                child: Obx(() => ListView.separated(
                      itemBuilder: (_, index) =>
                          CartItem(item: controller.carts[index])
                              .animate(
                                  delay: (100 * index).ms) // staggered per item
                              .fadeIn(duration: 400.ms)
                              .scale(
                                  begin: const Offset(0.8, 0.8),
                                  end: const Offset(1, 1),
                                  curve: Curves.easeOutBack)
                              .slideX(begin: -0.2, end: 0),
                      separatorBuilder: (_, __) => const SizedBox(height: 16),
                      itemCount: controller.carts.length,
                    )),
              ),

              const Spacer(),

              ///  Order Summary
              Obx(
                () => OrderSummary(
                  itemCount: controller.totalItems,
                  subtotal: controller.subtotal,
                  discount: controller.discount,
                  delivery: controller.deliveryCharge,
                  total: controller.total,
                )
                    .animate(delay: 600.ms)
                    .fadeIn(duration: 500.ms)
                    .slideY(begin: 0.3, end: 0),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: ElevatedButton(
          onPressed: () => Get.toNamed(AppRoutes.checkout),
          child: const Text('Check Out'),
        ).animate(delay: 900.ms).fadeIn(duration: 500.ms).scale(
              begin: const Offset(0.8, 0.8),
              end: const Offset(1, 1),
            ),
      ),
    );
  }
}