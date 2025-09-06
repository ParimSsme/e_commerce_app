import 'package:e_commerce_app/app/data/models/order_model.dart';

import '../../core/resources/app_images.dart';
import 'models/product_model.dart';

class DummyData {
  static const List<ProductModel> featuredList = [
    ProductModel(
      name: 'Watch',
      image: AppImages.watch,
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
      image: AppImages.nikeShoes,
      price: 430,
      description:
      'Culpa aliquam consequuntur veritatis at consequuntur praesentium beatae temporibus nobis. Velit dolorem facilis neque autem. Itaque voluptatem expedita qui eveniet id veritatis eaque. Blanditiis quia placeat nemo. Nobis laudantium nesciunt perspiciatis sit eligendi.',
      rate: 5,
      reviewCount: 18,
      sizes: [
        SizeModel(size: 8, isAvailable: true),
        SizeModel(size: 10, isAvailable: true),
        SizeModel(size: 38, isAvailable: true),
        SizeModel(size: 40, isAvailable: false),
      ],
    ),
    ProductModel(
      name: 'Airpods',
      image: AppImages.airpods,
      price: 333,
      description:
      'Culpa aliquam consequuntur veritatis at consequuntur praesentium beatae temporibus nobis. Velit dolorem facilis neque autem. Itaque voluptatem expedita qui eveniet id veritatis eaque. Blanditiis quia placeat nemo. Nobis laudantium nesciunt perspiciatis sit eligendi.',
      rate: 4.5,
      reviewCount: 2,
      sizes: [
        SizeModel(size: 8, isAvailable: true),
        SizeModel(size: 10, isAvailable: false),
        SizeModel(size: 38, isAvailable: true),
        SizeModel(size: 40, isAvailable: false),
      ],
    ),
  ];

  static const List<ProductModel> popularList = [
    ProductModel(
      name: 'LG TV',
      image: AppImages.LG_TV,
      price: 330,
      description:
      'Culpa aliquam consequuntur veritatis at consequuntur praesentium beatae temporibus nobis. Velit dolorem facilis neque autem. Itaque voluptatem expedita qui eveniet id veritatis eaque. Blanditiis quia placeat nemo. Nobis laudantium nesciunt perspiciatis sit eligendi.',
      rate: 2.5,
      reviewCount: 30,
      sizes: [
        SizeModel(size: 8, isAvailable: false),
        SizeModel(size: 10, isAvailable: false),
        SizeModel(size: 38, isAvailable: true),
        SizeModel(size: 40, isAvailable: false),
      ],
    ),
    ProductModel(
      name: 'Hoodie',
      image: AppImages.hoodie,
      price: 50,
      description:
      'Culpa aliquam consequuntur veritatis at consequuntur praesentium beatae temporibus nobis. Velit dolorem facilis neque autem. Itaque voluptatem expedita qui eveniet id veritatis eaque. Blanditiis quia placeat nemo. Nobis laudantium nesciunt perspiciatis sit eligendi.',
      rate: 1.5,
      reviewCount: 19,
      sizes: [
        SizeModel(size: 8, isAvailable: true),
        SizeModel(size: 10, isAvailable: false),
        SizeModel(size: 38, isAvailable: true),
        SizeModel(size: 40, isAvailable: false),
      ],
    ),
    ProductModel(
      name: 'Jacket',
      image: AppImages.jacket,
      price: 400,
      description:
      'Culpa aliquam consequuntur veritatis at consequuntur praesentium beatae temporibus nobis. Velit dolorem facilis neque autem. Itaque voluptatem expedita qui eveniet id veritatis eaque. Blanditiis quia placeat nemo. Nobis laudantium nesciunt perspiciatis sit eligendi.',
      sizes: [
        SizeModel(size: 8, isAvailable: false),
        SizeModel(size: 10, isAvailable: false),
        SizeModel(size: 38, isAvailable: false),
        SizeModel(size: 40, isAvailable: true),
      ],
    ),
  ];

  static const products = [
    ProductModel(
      name: 'Watch',
      image: AppImages.watch,
      price: 40,
      description: 'Premium wrist watch with modern design.',
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
      image: AppImages.nikeShoes,
      price: 430,
      description: 'Lightweight running shoes for athletes.',
      rate: 4.5,
      reviewCount: 18,
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
      image: AppImages.LG_TV,
      price: 330,
      description: 'Smart LED TV with 4K resolution.',
      rate: 4.2,
      reviewCount: 30,
      sizes: [],
      isFavourite: true,
    ),
    ProductModel(
      name: 'Airpods',
      image: AppImages.airpods,
      price: 333,
      description: 'Wireless earbuds with noise cancellation.',
      rate: 4.8,
      reviewCount: 25,
      sizes: [],
      isFavourite: true,
    ),
    ProductModel(
      name: 'Jacket',
      image: AppImages.jacket,
      price: 50,
      description: 'Warm and stylish winter jacket.',
      rate: 4.0,
      reviewCount: 15,
      sizes: [],
      isFavourite: false,
    ),
    ProductModel(
      name: 'Hoodie',
      image: AppImages.hoodie,
      price: 400,
      description: 'Casual hoodie for everyday wear.',
      rate: 4.1,
      reviewCount: 22,
      sizes: [],
      isFavourite: false,
    ),
    ProductModel(
      name: 'T-Shirt',
      image: AppImages.tShirt1,
      price: 25,
      description: 'Comfortable cotton T-shirt.',
      rate: 4.3,
      reviewCount: 12,
      sizes: [],
      isFavourite: true,
    ),
    ProductModel(
      name: 'T-Shirt',
      image: AppImages.tShirt2,
      price: 28,
      description: 'Trendy T-shirt with slim fit.',
      rate: 4.6,
      reviewCount: 20,
      sizes: [],
      isFavourite: true,
    ),
    ProductModel(
      name: 'Nike Shoes',
      image: AppImages.nikeShoe3,
      price: 530,
      description: 'Lightweight running shoes for athletes.',
      rate: 4.5,
      reviewCount: 18,
      sizes: [
        SizeModel(size: 8, isAvailable: true),
        SizeModel(size: 10, isAvailable: true),
        SizeModel(size: 38, isAvailable: true),
        SizeModel(size: 40, isAvailable: false),
      ],
      isFavourite: false,
    ),
    ProductModel(
      name: 'Nike Shoes',
      image: AppImages.nikeShoe1,
      price: 430,
      description: 'Lightweight running shoes for athletes.',
      rate: 4.5,
      reviewCount: 18,
      sizes: [
        SizeModel(size: 8, isAvailable: true),
        SizeModel(size: 10, isAvailable: true),
        SizeModel(size: 38, isAvailable: true),
        SizeModel(size: 40, isAvailable: false),
      ],
      isFavourite: true,
    ),
    ProductModel(
      name: 'Nike Shoes',
      image: AppImages.nikeShoe2,
      price: 600,
      description: 'Lightweight running shoes for athletes.',
      rate: 4.5,
      reviewCount: 18,
      sizes: [
        SizeModel(size: 8, isAvailable: true),
        SizeModel(size: 10, isAvailable: true),
        SizeModel(size: 38, isAvailable: true),
        SizeModel(size: 40, isAvailable: false),
      ],
      isFavourite: false,
    ),
  ];

  static const orders = <OrderModel>[
    OrderModel(
      productName: 'Watch',
      productImage: AppImages.watch,
      productPrice: 40,
      companyName: 'Rolex',
    ),
    OrderModel(
      productName: 'Airpods',
      productImage: AppImages.airpods,
      productPrice: 333,
      companyName: 'Apple',
    ),
    OrderModel(
      productName: 'Hoodie',
      productImage: AppImages.hoodie,
      productPrice: 50,
      companyName: 'Puma',
    ),
    OrderModel(
      productName: 'Nike Shoes',
      productImage: AppImages.nikeShoes,
      productPrice: 430,
      companyName: 'Nike',
      status: OrderStatus.completed,
    ),
    OrderModel(
      productName: 'Airpods',
      productImage: AppImages.airpods,
      productPrice: 333,
      companyName: 'Samsung Galaxy Buds',
      status: OrderStatus.completed,
    ),
    OrderModel(
      productName: 'Jacket',
      productImage: AppImages.jacket,
      productPrice: 50,
      companyName: 'North Face',
      status: OrderStatus.cancel,
    ),
    OrderModel(
      productName: 'Hoodie',
      productImage: AppImages.hoodie,
      productPrice: 400,
      companyName: 'Adidas',
      status: OrderStatus.cancel,
    ),
    OrderModel(
      productName: 'T-Shirt',
      productImage: AppImages.tShirt1,
      productPrice: 25,
      companyName: 'Nike',
      status: OrderStatus.cancel,
    ),
  ];

}
