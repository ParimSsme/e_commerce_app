import 'package:flutter/material.dart';
import '../../controllers/cart_controller.dart';
import 'check_out_screen.dart';
import 'package:get/get.dart';
import '../widgets/cart_item.dart';
import '../widgets/order_summary.dart';

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
        ),
        title: const Text('Cart'),
        centerTitle: true,
        actions: [
          RawMaterialButton(
            onPressed: controller.onMenuPressed,
            fillColor: Colors.grey.shade300,
            padding: const EdgeInsets.all(12.0),
            shape: const CircleBorder(),
            child: const Icon(Icons.more_vert, size: 24.0),
          ),
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
                  itemBuilder: (_, index) =>
                      CartItem(item: controller.carts[index]),
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
              )),

              const Spacer(),

              // ✅ Checkout Button
              TextButton(
                onPressed: () => Get.to(() => const CheckOutScreen()),
                child: const Text('Check Out'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

