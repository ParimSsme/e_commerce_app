import 'package:e_commerce_app/app/ui/theme/app_colors.dart';
import 'package:e_commerce_app/app/ui/widgets/circle_icon_button.dart';
import 'package:e_commerce_app/core/resources/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../controllers/checkout_controller.dart';
import '../theme/app_text_styles.dart';
import '../widgets/order_summary.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../widgets/payment_option.dart';

class CheckOutScreen extends GetView<CheckoutController> {
  const CheckOutScreen({super.key});

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
        title: const Text('Checkout')
            .animate(delay: 200.ms)
            .fadeIn(duration: 500.ms)
            .slideY(begin: -0.2, end: 0),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 15,
            children: [
              /// Delivery Address
              _DeliveryAddress()
                  .animate(delay: 300.ms)
                  .fadeIn(duration: 500.ms)
                  .slideX(begin: -0.2, end: 0),

              /// Delivery Time
              _DeliveryTime()
                  .animate(delay: 500.ms)
                  .fadeIn(duration: 500.ms)
                  .slideX(begin: 0.2, end: 0),

              const Spacer(),

              /// Order Summary
              Obx(() => OrderSummary(
                    itemCount: controller.itemCount.value,
                    subtotal: controller.subtotal.value,
                    discount: controller.discount.value,
                    delivery: controller.deliveryCharge.value,
                    total: controller.total,
                  ).animate(delay: 700.ms).fadeIn(duration: 500.ms).scale(
                      begin: const Offset(0.9, 0.9),
                      end: const Offset(1, 1),
                      curve: Curves.easeOutBack)),

              const Spacer(),

              /// Payment Methods
              const Text('Choose payment method',
                      style: AppTextStyles.headingMedium)
                  .animate(delay: 900.ms)
                  .fadeIn(duration: 400.ms)
                  .slideY(begin: 0.2, end: 0),

              Obx(() => Column(
                    spacing: 10,
                    children: controller.paymentMethods
                        .map((method) => PaymentOption(
                              icon: method.icon,
                              label: method.name,
                              isSelected: controller.selectedPayment.value ==
                                  method.name,
                              onTap: () =>
                                  controller.selectPayment(method.name),
                            )
                                .animate(
                                    delay: 1000.ms +
                                        (controller.paymentMethods
                                                    .indexOf(method) *
                                                200)
                                            .ms)
                                .fadeIn(duration: 400.ms)
                                .slideY(begin: 0.3, end: 0))
                        .toList(),
                  )),

              /// Add Payment
              GestureDetector(
                onTap: controller.addPaymentMethod,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Add new payment method',
                      style: AppTextStyles.headingMedium.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Container(
                      width: 24,
                      height: 24,
                      decoration: const BoxDecoration(
                        color: AppColors.secondary,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.add,
                        size: 16.0,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
              )
                  .animate(delay: 1400.ms)
                    .fadeIn(duration: 500.ms)
                    .slideX(begin: -0.2, end: 0),

              const Spacer(),

              /// Confirm Checkout Button
              ElevatedButton(
                onPressed: controller.onCheckout,
                child: const Text('Confirm Order'),
              ).animate(delay: 1600.ms).fadeIn(duration: 600.ms).scale(
                    begin: const Offset(0.8, 0.8),
                    end: const Offset(1, 1),
                    curve: Curves.elasticOut,
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
          fillColor: AppColors.secondary,
          padding: const EdgeInsets.all(15.0),
          shape: const CircleBorder(),
          child: SvgPicture.asset(AppIcons.location),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '325 15th Eighth Avenue, NewYork',
              style: AppTextStyles.displayLarge.copyWith(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Saepe eaque fugiat ea voluptatum veniam.',
              maxLines: 2,
              style: AppTextStyles.bodySmall.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
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
          fillColor: Colors.blue.shade50,
          padding: const EdgeInsets.all(10.0),
          shape: const CircleBorder(),
          child: const Icon(Icons.access_time_filled_rounded,
              color: Color(0xff6055d8), size: 34),
        ),
        Text(
          '6:00 pm, Wednesday 20',
          style: AppTextStyles.displayLarge.copyWith(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
