import 'package:e_commerce_app/app/data/models/order_model.dart';
import 'package:e_commerce_app/app/ui/widgets/rounded_text_button.dart';
import 'package:flutter/material.dart';

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
              Text(item.productName),
              Text(item.companyName),
              Text('\$${item.productPrice}'),
            ],
          ),

          const Spacer(),

          RoundedTextButton(onPressed: (){}, text: 'Track Order', padding: const EdgeInsets.symmetric(horizontal: 15),),
        ],
      ),
    );
  }
}
