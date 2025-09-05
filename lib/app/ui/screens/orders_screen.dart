import 'package:e_commerce_app/app/controllers/orders_controller.dart';
import 'package:e_commerce_app/app/ui/widgets/order_item/active_order_item.dart';
import 'package:e_commerce_app/app/ui/widgets/order_item/cancelled_order_item.dart';
import 'package:e_commerce_app/app/ui/widgets/order_item/completed_order_item.dart';
import 'package:flutter/material.dart';
import '../../data/models/order_model.dart';
import 'package:get/get.dart';


class OrdersScreen extends GetView<OrdersController> {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 50),
          // Custom TabBar
          Obx(() => Container(
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
                        padding: const EdgeInsets.symmetric(vertical: 12),
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
                );
              }),
            ),
          )),
          const SizedBox(height: 20),
          // Body list
          Expanded(
            child: Obx(() => ListView.builder(
              itemCount: controller.displayedOrders.length,
              itemBuilder: (context, index) {
                final order = controller.displayedOrders[index];
                if (order.status == OrderStatus.cancel) {
                  return CancelledOrderItem(item: order);
                } else if (order.status == OrderStatus.completed) {
                  return CompletedOrderItem(item: order);
                } else {
                  return ActiveOrderItem(item: order);
                }
              },
            )),
          ),
        ],
      ),
    );
  }
}


