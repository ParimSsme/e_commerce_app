import 'package:e_commerce_app/core/app_icon_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../controllers/checkout_controller.dart';
import '../widgets/order_summary.dart';

class CheckOutScreen extends GetView<CheckoutController> {
  const CheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 48,
        leading: RawMaterialButton(
          onPressed: Get.back,
          fillColor: Colors.grey.shade200,
          padding: const EdgeInsets.only(left: 5.0),
          shape: const CircleBorder(),
          child: const Icon(Icons.arrow_back_ios, size: 24.0),
        ),
        title: const Text('Checkout'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // 📍 Delivery Address
              _DeliveryAddress(),

              const SizedBox(height: 15),

              // ⏰ Delivery Time
              _DeliveryTime(),

              const Spacer(),

              // 📊 Order Summary (reused widget)
              Obx(() => OrderSummary(
                itemCount: controller.itemCount.value,
                subtotal: controller.subtotal.value,
                discount: controller.discount.value,
                delivery: controller.deliveryCharge.value,
                total: controller.total,
              )),

              const Spacer(),

              const Text('Choose payment method'),
              const SizedBox(height: 10),

              // 💳 Payment Methods
              Obx(() => Column(
                children: controller.paymentMethods
                    .map((method) => _PaymentOption(
                  icon: method.icon,
                  label: method.name,
                  isSelected: controller.selectedPayment.value ==
                      method.name,
                  onTap: () =>
                      controller.selectPayment(method.name),
                ))
                    .toList(),
              )),

              const SizedBox(height: 10),

              // ➕ Add Payment
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Add new payment method'),
                  RawMaterialButton(
                    onPressed: controller.addPaymentMethod,
                    fillColor: Colors.grey.shade200,
                    constraints: BoxConstraints.tight(Size(24, 24)),
                    padding: EdgeInsets.zero,
                    shape: const CircleBorder(),
                    child: const Icon(Icons.add,
                        size: 13.0, color: Color(0xff6055d8)),
                  ),
                ],
              ),

              const Spacer(),

              // ✅ Confirm Checkout
              TextButton(
                onPressed: controller.onCheckout,
                child: const Text('Confirm Order'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DeliveryAddress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RawMaterialButton(
          onPressed: () {},
          fillColor: Colors.grey.shade200,
          padding: const EdgeInsets.all(15.0),
          shape: const CircleBorder(),
          child: SvgPicture.asset(AppIconAssets.location),
        ),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('325 15th Eighth Avenue, NewYork'),
            Text('Saepe eaque fugiat ea voluptatum veniam.'),
          ],
        )
      ],
    );
  }
}

class _DeliveryTime extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RawMaterialButton(
          onPressed: () {},
          fillColor: const Color(0x7163cdff),
          padding: const EdgeInsets.all(10.0),
          shape: const CircleBorder(),
          child: const Icon(Icons.access_time_filled_rounded,
              color: Color(0xff6055d8), size: 34),
        ),
        const Text('6:00 pm, Wednesday 20'),
      ],
    );
  }
}

class _PaymentOption extends StatelessWidget {
  final String icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _PaymentOption({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          SvgPicture.asset(icon),
          const SizedBox(width: 8),
          Text(label),
          const Spacer(),
          Checkbox(
            value: isSelected,
            onChanged: (_) => onTap(),
          ),
        ],
      ),
    );
  }
}
