import '../../core/app_image_assets.dart';
import 'models/product_model.dart';

class DummyData {
  static const List<ProductModel> featuredList = [
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
      image: AppImageAssets.airpods,
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
      image: AppImageAssets.LG_TV,
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
      image: AppImageAssets.hoodie,
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
      image: AppImageAssets.jacket,
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
      image: AppImageAssets.watch,
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
      image: AppImageAssets.nikeShoes,
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
      image: AppImageAssets.LG_TV,
      price: 330,
      description: 'Smart LED TV with 4K resolution.',
      rate: 4.2,
      reviewCount: 30,
      sizes: [],
      isFavourite: true,
    ),
    ProductModel(
      name: 'Airpods',
      image: AppImageAssets.airpods,
      price: 333,
      description: 'Wireless earbuds with noise cancellation.',
      rate: 4.8,
      reviewCount: 25,
      sizes: [],
      isFavourite: true,
    ),
    ProductModel(
      name: 'Jacket',
      image: AppImageAssets.jacket,
      price: 50,
      description: 'Warm and stylish winter jacket.',
      rate: 4.0,
      reviewCount: 15,
      sizes: [],
      isFavourite: false,
    ),
    ProductModel(
      name: 'Hoodie',
      image: AppImageAssets.hoodie,
      price: 400,
      description: 'Casual hoodie for everyday wear.',
      rate: 4.1,
      reviewCount: 22,
      sizes: [],
      isFavourite: false,
    ),
    ProductModel(
      name: 'T-Shirt',
      image: AppImageAssets.tShirt1,
      price: 25,
      description: 'Comfortable cotton T-shirt.',
      rate: 4.3,
      reviewCount: 12,
      sizes: [],
      isFavourite: true,
    ),
    ProductModel(
      name: 'T-Shirt',
      image: AppImageAssets.tShirt2,
      price: 28,
      description: 'Trendy T-shirt with slim fit.',
      rate: 4.6,
      reviewCount: 20,
      sizes: [],
      isFavourite: true,
    ),
  ];

}
