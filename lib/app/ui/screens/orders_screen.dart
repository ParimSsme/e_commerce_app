import 'package:e_commerce_app/app/controllers/orders_controller.dart';
import 'package:e_commerce_app/app/ui/widgets/order_item/active_order_item.dart';
import 'package:e_commerce_app/app/ui/widgets/order_item/cancelled_order_item.dart';
import 'package:e_commerce_app/app/ui/widgets/order_item/completed_order_item.dart';
import 'package:flutter/material.dart';
import '../../data/models/order_model.dart';
import 'package:get/get.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../widgets/circle_icon_button.dart';

class OrdersScreen extends GetView<OrdersController> {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
        title: const Text('Orders')
            .animate(delay: 200.ms)
            .fadeIn(duration: 500.ms)
            .slideY(begin: -0.2, end: 0),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            spacing: 10,
            children: [

              /// Custom TabBar
              Obx(
                    () => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(controller.tabs.length, (index) {
                      final isSelected = controller.selectedIndex.value == index;
                      return GestureDetector(
                        onTap: () => controller.changeTab(index),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Text(
                                controller.tabs[index],
                                style: TextStyle(
                                  color: isSelected
                                      ? Colors.deepPurple
                                      : Colors.black,
                                  fontWeight: isSelected
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              height: 4,
                              width: 60,
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? Colors.deepPurple
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                          ],
                        ),
                      )
                          .animate(delay: (index * 100).ms)
                          .fadeIn(duration: 400.ms)
                          .slideY(begin: -0.2, end: 0, curve: Curves.easeOut);
                    }),
                  ),
                ),
              ),

              /// Orders List
              Expanded(
                child: Obx(
                      () => AnimatedSwitcher(
                    duration: const Duration(milliseconds: 500),
                    transitionBuilder: (child, animation) {
                      return FadeTransition(
                        opacity: animation,
                        child: SlideTransition(
                          position: animation.drive(
                            Tween<Offset>(
                              begin: const Offset(0.1, 0), // slide from right
                              end: Offset.zero,
                            ).chain(CurveTween(curve: Curves.easeOut)),
                          ),
                          child: child,
                        ),
                      );
                    },
                    child: ListView.builder(
                      key: ValueKey(controller.selectedIndex.value), // important!
                      itemCount: controller.displayedOrders.length,
                      itemBuilder: (context, index) {
                        final order = controller.displayedOrders[index];

                        final Widget item;
                        if (order.status == OrderStatus.cancel) {
                          item = CancelledOrderItem(item: order);
                        } else if (order.status == OrderStatus.completed) {
                          item = CompletedOrderItem(item: order);
                        } else {
                          item = ActiveOrderItem(item: order);
                        }

                        return item
                            .animate(delay: (index * 120).ms)
                            .fadeIn(duration: 400.ms)
                            .slideY(begin: 0.1, end: 0, curve: Curves.easeOut);
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    )
    // Whole screen entry animation
        .animate()
        .fadeIn(duration: 300.ms)
        .slideY(begin: 0.05, end: 0);
  }
}


