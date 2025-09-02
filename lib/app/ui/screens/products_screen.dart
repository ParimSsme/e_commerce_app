import 'package:e_commerce_app/app/ui/screens/product_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/app_icon_assets.dart';
import '../../../core/app_image_assets.dart';
import '../../data/models/product_model.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  final products = const [
    ProductModel(
      name: 'Watch',
      image: AppImageAssets.watch,
      price: 40,
      description:
          'Culpa aliquam consequuntur veritatis at consequuntur praesentium beatae temporibus nobis. Velit dolorem facilis neque autem. Itaque voluptatem expedita qui eveniet id veritatis eaque. Blanditiis quia placeat nemo. Nobis laudantium nesciunt perspiciatis sit eligendi.',
      rate: 4.5,
      reviewCount: 10,
      sizes: [
        SizeModel(size: 8, isAvailable: true),
        SizeModel(size: 10, isAvailable: true),
        SizeModel(size: 38, isAvailable: true),
        SizeModel(size: 40, isAvailable: false),
      ],
    ),
    ProductModel(
      name: 'Nike Shoes',
      image: AppImageAssets.nikeShoes,
      price: 430,
      description:
          'Culpa aliquam consequuntur veritatis at consequuntur praesentium beatae temporibus nobis. Velit dolorem facilis neque autem. Itaque voluptatem expedita qui eveniet id veritatis eaque. Blanditiis quia placeat nemo. Nobis laudantium nesciunt perspiciatis sit eligendi.',
      rate: 4.5,
      reviewCount: 10,
      sizes: [
        SizeModel(size: 8, isAvailable: true),
        SizeModel(size: 10, isAvailable: true),
        SizeModel(size: 38, isAvailable: true),
        SizeModel(size: 40, isAvailable: false),
      ],
      isFavourite: true,
    ),
    ProductModel(
      name: 'LG TV',
      image: AppImageAssets.LG_TV,
      price: 330,
      description:
          'Culpa aliquam consequuntur veritatis at consequuntur praesentium beatae temporibus nobis. Velit dolorem facilis neque autem. Itaque voluptatem expedita qui eveniet id veritatis eaque. Blanditiis quia placeat nemo. Nobis laudantium nesciunt perspiciatis sit eligendi.',
      rate: 4.5,
      reviewCount: 10,
      sizes: [
        SizeModel(size: 8, isAvailable: true),
        SizeModel(size: 10, isAvailable: true),
        SizeModel(size: 38, isAvailable: true),
        SizeModel(size: 40, isAvailable: false),
      ],
      isFavourite: true,
    ),
    ProductModel(
      name: 'Airpods',
      image: AppImageAssets.airpods,
      price: 333,
      description:
          'Culpa aliquam consequuntur veritatis at consequuntur praesentium beatae temporibus nobis. Velit dolorem facilis neque autem. Itaque voluptatem expedita qui eveniet id veritatis eaque. Blanditiis quia placeat nemo. Nobis laudantium nesciunt perspiciatis sit eligendi.',
      rate: 4.5,
      reviewCount: 10,
      sizes: [
        SizeModel(size: 8, isAvailable: true),
        SizeModel(size: 10, isAvailable: true),
        SizeModel(size: 38, isAvailable: true),
        SizeModel(size: 40, isAvailable: false),
      ],
      isFavourite: true,
    ),
    ProductModel(
      name: 'Jacket',
      image: AppImageAssets.jacket,
      price: 50,
      description:
          'Culpa aliquam consequuntur veritatis at consequuntur praesentium beatae temporibus nobis. Velit dolorem facilis neque autem. Itaque voluptatem expedita qui eveniet id veritatis eaque. Blanditiis quia placeat nemo. Nobis laudantium nesciunt perspiciatis sit eligendi.',
      rate: 4.5,
      reviewCount: 10,
      sizes: [
        SizeModel(size: 8, isAvailable: true),
        SizeModel(size: 10, isAvailable: true),
        SizeModel(size: 38, isAvailable: true),
        SizeModel(size: 40, isAvailable: false),
      ],
      isFavourite: false,
    ),
    ProductModel(
      name: 'Hoodie',
      image: AppImageAssets.hoodie,
      price: 400,
      description:
          'Culpa aliquam consequuntur veritatis at consequuntur praesentium beatae temporibus nobis. Velit dolorem facilis neque autem. Itaque voluptatem expedita qui eveniet id veritatis eaque. Blanditiis quia placeat nemo. Nobis laudantium nesciunt perspiciatis sit eligendi.',
      rate: 4.5,
      reviewCount: 10,
      sizes: [
        SizeModel(size: 8, isAvailable: true),
        SizeModel(size: 10, isAvailable: true),
        SizeModel(size: 38, isAvailable: true),
        SizeModel(size: 40, isAvailable: false),
      ],
      isFavourite: false,
    ),
    ProductModel(
      name: 'T-Shirt',
      image: AppImageAssets.tShirt1,
      price: 400,
      description:
          'Culpa aliquam consequuntur veritatis at consequuntur praesentium beatae temporibus nobis. Velit dolorem facilis neque autem. Itaque voluptatem expedita qui eveniet id veritatis eaque. Blanditiis quia placeat nemo. Nobis laudantium nesciunt perspiciatis sit eligendi.',
      rate: 4.5,
      reviewCount: 10,
      sizes: [
        SizeModel(size: 8, isAvailable: true),
        SizeModel(size: 10, isAvailable: true),
        SizeModel(size: 38, isAvailable: true),
        SizeModel(size: 40, isAvailable: false),
      ],
      isFavourite: true,
    ),
    ProductModel(
      name: 'T-Shirt',
      image: AppImageAssets.tShirt2,
      price: 400,
      description:
          'Culpa aliquam consequuntur veritatis at consequuntur praesentium beatae temporibus nobis. Velit dolorem facilis neque autem. Itaque voluptatem expedita qui eveniet id veritatis eaque. Blanditiis quia placeat nemo. Nobis laudantium nesciunt perspiciatis sit eligendi.',
      rate: 4.5,
      reviewCount: 10,
      sizes: [
        SizeModel(size: 8, isAvailable: true),
        SizeModel(size: 10, isAvailable: true),
        SizeModel(size: 38, isAvailable: true),
        SizeModel(size: 40, isAvailable: false),
      ],
      isFavourite: true,
    ),
  ];
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
        title: const Text('Products'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 17,
              crossAxisSpacing: 25,
              childAspectRatio: 1 / 1.1,
            ),
            shrinkWrap: false,
            padding: const EdgeInsets.all(15),
            itemCount: products.length,
            itemBuilder: (_, int index) {
              return ProductListItem(item: products[index]);
            }),
      ),
    );
  }
}

class ProductListItem extends StatelessWidget {
  final ProductModel item;
  const ProductListItem({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ProductDetail(product: item),
        ),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 134,
              alignment: Alignment.topRight,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(item.image),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.circular(13),
              ),
              child: IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  item.isFavourite
                      ? AppIconAssets.favouriteFilled
                      : AppIconAssets.favourite,
                  width: 24,
                  height: 24,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.name,
                        style: textTheme.titleSmall,
                      ),
                      Text(
                        '\$${item.price}',
                        style: textTheme.bodyMedium?.copyWith(
                          color: const Color(0xff6055d8),
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(AppIconAssets.plus),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
