import 'package:e_commerce_app/app/ui/widgets/circle_icon_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/resources/app_icons.dart';
import '../../controllers/cart_controller.dart';
import '../../data/models/cart_model.dart';
import 'package:get/get.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class CartItem extends GetView<CartController> {
  final CartModel item;

  const CartItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.all(8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: 10,
        children: [
          /// Product Image
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

          /// Product Info
          Expanded(
            child: Column(
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
          ),

          /// Actions
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              /// Delete
              Padding(
                padding: const EdgeInsets.only(right: 10.0, top: 10),
                child: GestureDetector(
                  onTap: () => controller.removeFromCart(item),
                  child: SvgPicture.asset(AppIcons.delete),
                ),
              ),

              // Quantity Selector
              Row(
                spacing: 10,
                children: [
                  CircleIconButton(
                    size: 30,
                    iconSize: 30,
                    backgroundColor: AppColors.primary,
                    onPressed: () => controller.decreaseQuantity(item),
                    icon: CupertinoIcons.minus,
                    iconColor: AppColors.onPrimary,
                  ),
                  Text(
                    item.productCount.toString().padLeft(2, '0'),
                    style: AppTextStyles.headlineSmall.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  CircleIconButton(
                    size: 30,
                    iconSize: 30,
                    backgroundColor: AppColors.primary,
                    onPressed: () => controller.increaseQuantity(item),
                    icon: Icons.add,
                    iconColor: AppColors.onPrimary,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
