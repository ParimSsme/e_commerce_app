import 'package:e_commerce_app/app/data/models/order_model.dart';
import 'package:e_commerce_app/app/ui/widgets/rounded_button.dart';
import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';

class ActiveOrderItem extends StatelessWidget {
  final OrderModel item;

  const ActiveOrderItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // Product Image
          SizedBox(
            height: 99,
            width: 126,
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: AssetImage(item.productImage),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),

          // Product Info
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.productName,
                style: AppTextStyles.headlineSmall.copyWith(
                  fontSize: 16,
                ),
              ),
              Text(item.companyName),
              Text(
                '\$${item.productPrice}',
                style: AppTextStyles.headlineSmall.copyWith(
                  color: AppColors.primary,
                  fontSize: 14,
                ),
              ),
            ],
          ),

          const Spacer(),

          ElevatedButton(
            onPressed: () {},
            child: Text(
              'Track Order',
              style: AppTextStyles.displayMedium.copyWith(
                color: AppColors.onPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
