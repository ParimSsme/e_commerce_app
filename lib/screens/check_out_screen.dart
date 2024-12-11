import 'package:e_commerce_app/core/app_icon_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 48,
        leading: RawMaterialButton(
          onPressed: () {},
          fillColor: Colors.grey.shade200,
          padding: const EdgeInsets.only(left: 5.0),
          shape: const CircleBorder(),
          child: const Icon(
            Icons.arrow_back_ios,
            size: 24.0,
          ),
        ),
        title: const Text('Cart'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  RawMaterialButton(
                    onPressed: () {},
                    fillColor: Colors.grey.shade200,
                    padding: const EdgeInsets.all(15.0),
                    shape: const CircleBorder(),
                    child: SvgPicture.asset(
                      AppIconAssets.location,
                    ),
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('325 15th Eighth Avenue, NewYork'),
                      Text('Saepe eaque fugiat ea voluptatum veniam.'),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  RawMaterialButton(
                    onPressed: () {},
                    fillColor: const Color(0x7163cdff),
                    padding: const EdgeInsets.all(10.0),
                    shape: const CircleBorder(),
                    child: const Icon(
                      Icons.access_time_filled_rounded,
                      color: Color(0xff6055d8),
                      size: 34,
                    ),
                  ),
                  const Text('6:00 pm, Wednesday 20')
                ],
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
              const Text('Choose payment method'),
              const SizedBox(height: 10),
              Row(
                children: [
                  SvgPicture.asset(AppIconAssets.paypal),
                  const SizedBox(width: 8),
                  const Text('Paypal'),
                  const Spacer(),
                  Checkbox(
                    value: false,
                    onChanged: (val) {},
                  ),
                ],
              ),
              Row(
                children: [
                  SvgPicture.asset(AppIconAssets.creditCard),
                  const SizedBox(width: 8),
                  const Text('Credit Card'),
                  const Spacer(),
                  Checkbox(
                    value: false,
                    onChanged: (val) {},
                  ),
                ],
              ),
              Row(
                children: [
                  SvgPicture.asset(AppIconAssets.cash),
                  const SizedBox(width: 8),
                  const Text('Cash'),
                  const Spacer(),
                  Checkbox(
                    value: false,
                    onChanged: (val) {},
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Add new payment method'),
                  RawMaterialButton(
                    onPressed: () {},
                    fillColor: Colors.grey.shade200,
                    padding: const EdgeInsets.all(0),
                    constraints: BoxConstraints.tight(const Size(24, 24)),
                    shape: const CircleBorder(),
                    child: const Icon(
                      Icons.add,
                      size: 13.0,
                      color: Color(0xff6055d8),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              TextButton(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const CheckOutScreen(),
                  ),
                ),
                child: const Text('Check Out'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
