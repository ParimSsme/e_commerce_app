import 'package:flutter/material.dart';
import '../../controllers/cart_controller.dart';
import 'check_out_screen.dart';
import 'package:get/get.dart';
import '../widgets/cart_item.dart';
import '../widgets/order_summary.dart';
import 'package:flutter_animate/flutter_animate.dart';

class CartScreen extends GetView<CartController> {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        leadingWidth: 48,
        leading: RawMaterialButton(
          onPressed: Get.back,
          fillColor: Colors.grey.shade300,
          padding: const EdgeInsets.only(left: 5.0),
          shape: const CircleBorder(),
          child: const Icon(Icons.arrow_back_ios, size: 24.0),
        )
            .animate()
            .fadeIn(duration: 400.ms)
            .slideX(begin: -0.3, end: 0),
        title: const Text('Cart')
            .animate(delay: 200.ms)
            .fadeIn(duration: 500.ms)
            .slideY(begin: -0.2, end: 0),
        centerTitle: true,
        actions: [
          RawMaterialButton(
            onPressed: controller.onMenuPressed,
            fillColor: Colors.grey.shade300,
            padding: const EdgeInsets.all(12.0),
            shape: const CircleBorder(),
            child: const Icon(Icons.more_vert, size: 24.0),
          )
              .animate(delay: 300.ms)
              .fadeIn(duration: 400.ms)
              .slideX(begin: 0.3, end: 0),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              // 🛒 Cart Items List
              SizedBox(
                height: height * 0.44,
                child: Obx(() => ListView.separated(
                  itemBuilder: (_, index) => CartItem(item: controller.carts[index])
                      .animate(delay: (100 * index).ms) // staggered per item
                      .fadeIn(duration: 400.ms)
                      .scale(begin: const Offset(0.8, 0.8), end: Offset(1, 1), curve: Curves.easeOutBack)
                      .slideX(begin: -0.2, end: 0),
                  separatorBuilder: (_, __) => const SizedBox(height: 16),
                  itemCount: controller.carts.length,
                )),
              ),

              const Spacer(),

              // 📊 Order Summary
              Obx(() => OrderSummary(
                itemCount: controller.totalItems,
                subtotal: controller.subtotal,
                discount: controller.discount,
                delivery: controller.deliveryCharge,
                total: controller.total,
              )
                  .animate(delay: 600.ms)
                  .fadeIn(duration: 500.ms)
                  .slideY(begin: 0.3, end: 0)),

              const Spacer(),

              TextButton(
                onPressed: () => Get.to(() => const CheckOutScreen()),
                child: const Text('Check Out'),
              )
                  .animate(delay: 900.ms)
                  .fadeIn(duration: 500.ms)
                  .scale(begin: const Offset(0.8, 0.8), end: Offset(1, 1))
                  .shake(hz: 3, curve: Curves.easeInOut),
            ],
          ),
        ),
      ),
    );
  }
}


