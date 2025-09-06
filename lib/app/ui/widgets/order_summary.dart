import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class OrderSummary extends StatelessWidget {
  final int itemCount;
  final double subtotal;
  final double discount;
  final double delivery;
  final double total;

  const OrderSummary({
    super.key,
    required this.itemCount,
    required this.subtotal,
    required this.discount,
    required this.delivery,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 5,
              children: [
                const Text('Order Summary', style: AppTextStyles.headlineSmall),
                _buildRow('Items', '$itemCount'),
                _buildRow('Subtotal', '\$$subtotal'),
                _buildRow('Discount', '\$$discount'),
                _buildRow('Delivery Charges', '\$$delivery'),
              ],
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total',
                  style: AppTextStyles.headlineSmall,
                ),
                Text('\$$total', style: AppTextStyles.headlineSmall),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRow(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppTextStyles.displayLarge,
        ),
        Text(
          value,
          style: AppTextStyles.headlineSmall.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }
}
