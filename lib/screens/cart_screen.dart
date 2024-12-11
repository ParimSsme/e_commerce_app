import 'package:e_commerce_app/core/app_icon_assets.dart';
import 'package:e_commerce_app/core/app_image_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../models/cart_model.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  final carts = const [
    CartModel(
      productName: 'Watch',
      productImage: AppImageAssets.watch,
      productPrice: 40,
      companyName: 'Rolex',
      productCount: 2,
    ),
    CartModel(
      productName: 'Airpods',
      productImage: AppImageAssets.airpods,
      productPrice: 333,
      companyName: 'Apple',
      productCount: 2,
    ),
    CartModel(
      productName: 'Hoodie',
      productImage: AppImageAssets.hoodie,
      productPrice: 50,
      companyName: 'Puma',
      productCount: 2,
    ),
    CartModel(
      productName: 'Hoodie',
      productImage: AppImageAssets.hoodie,
      productPrice: 50,
      companyName: 'Puma',
      productCount: 2,
    ),
    CartModel(
      productName: 'Hoodie',
      productImage: AppImageAssets.hoodie,
      productPrice: 50,
      companyName: 'Puma',
      productCount: 2,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        leadingWidth: 48,
        leading: RawMaterialButton(
          onPressed: () {},
          fillColor: Colors.grey.shade300,
          padding: const EdgeInsets.only(left: 5.0),
          shape: const CircleBorder(),
          child: const Icon(
            Icons.arrow_back_ios,
            size: 24.0,
          ),
        ),
        title: const Text('Cart'),
        centerTitle: true,
        actions: [
          RawMaterialButton(
            onPressed: () {},
            fillColor: Colors.grey.shade300,
            padding: const EdgeInsets.all(12.0),
            shape: const CircleBorder(),
            child: const Icon(
              Icons.more_vert,
              size: 24.0,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              SizedBox(
                height: height * 0.44,
                child: ListView.separated(
                  itemBuilder: (BuildContext context, int index) {
                    return CartLitItem(item: carts[index]);
                  },
                  separatorBuilder: (_, __) => const SizedBox(height: 16),
                  itemCount: carts.length,
                ),
              ),
              const Spacer(),
              DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Order Summary'),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Items'),
                              Text('3'),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Subtotal'),
                              Text('\$423'),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Discount'),
                              Text('\$4'),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Delivery Charges'),
                              Text('\$2'),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Total'),
                              Text('\$423'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              TextButton(onPressed: (){}, child: const Text('Check Out'),),
            ],
          ),
        ),
      ),
    );
  }
}

class CartLitItem extends StatelessWidget {
  final CartModel item;
  const CartLitItem({
    super.key,
    required this.item,
  });

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
          SizedBox(
            height: 99,
            width: 126,
            child: DecoratedBox(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: AssetImage(item.productImage),
                    fit: BoxFit.fill,
                  )),
            ),
          ),
          const SizedBox(width: 10),
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
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10.0, top: 10),
                child: SvgPicture.asset(AppIconAssets.delete),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(AppIconAssets.minus),
                  ),
                  Text(item.productCount.toString().padLeft(2, '0')),
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(AppIconAssets.plus),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
