import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/app_icon_assets.dart';
import '../../controllers/cart_controller.dart';
import '../../data/models/cart_model.dart';
import 'package:get/get.dart';

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
              Text(item.productName),
              Text(item.companyName),
              Text('\$${item.productPrice}'),
            ],
          ),

          const Spacer(),

          // Actions
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // Delete
              Padding(
                padding: const EdgeInsets.only(right: 10.0, top: 10),
                child: GestureDetector(
                  onTap: () => controller.removeFromCart(item),
                  child: SvgPicture.asset(AppIconAssets.delete),
                ),
              ),

              // Quantity Selector
              Row(
                children: [
                  IconButton(
                    onPressed: () => controller.decreaseQuantity(item),
                    icon: SvgPicture.asset(AppIconAssets.minus),
                  ),
                  Text(item.productCount.toString().padLeft(2, '0')),
                  IconButton(
                    onPressed: () => controller.increaseQuantity(item),
                    icon: SvgPicture.asset(AppIconAssets.plus),
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
