import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app/core/app_icon_assets.dart';
import 'package:e_commerce_app/core/app_image_assets.dart';
import 'package:e_commerce_app/models/product_model.dart';
import 'package:e_commerce_app/screens/product_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
];

final List<Widget> imageSliders = imgList
    .map((item) => Container(
  child: Container(
    margin: EdgeInsets.all(5.0),
    decoration: BoxDecoration(
      color: Color(0xff6055d8),
    ),
    child: Row(
      children: [
        const Column(
          children: [
            Text('Get Winter Discount'),
            Text('20% Off'),
            Text('For Children'),
          ],
        ),
        Image.asset(AppImageAssets.sliderBoy),
      ],
    ),
  ),
))
    .toList();
class CarouselWithIndicatorDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicatorDemo> {
  int _current = 0;
  final CarouselSliderController _controller = CarouselSliderController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Carousel with indicator controller demo')),
      body: Column(children: [
        Expanded(
          child: CarouselSlider(
            items: imageSliders,
            carouselController: _controller,
            options: CarouselOptions(
              disableCenter: true,
                autoPlay: true,
                enlargeCenterPage: false,
                // aspectRatio: 2.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imgList.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 12.0,
                height: 12.0,
                margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : const Color(0xff6055d8))
                        .withOpacity(_current == entry.key ? 0.9 : 0.4)),
              ),
            );
          }).toList(),
        ),
      ]),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _current = 0;
  final CarouselSliderController _controller = CarouselSliderController();


  final List<ProductModel> featuredList = const [
    ProductModel(
      name: 'Watch',
      image: AppImageAssets.watch,
      price: 40,
      description: 'Culpa aliquam consequuntur veritatis at consequuntur praesentium beatae temporibus nobis. Velit dolorem facilis neque autem. Itaque voluptatem expedita qui eveniet id veritatis eaque. Blanditiis quia placeat nemo. Nobis laudantium nesciunt perspiciatis sit eligendi.',
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
      description: 'Culpa aliquam consequuntur veritatis at consequuntur praesentium beatae temporibus nobis. Velit dolorem facilis neque autem. Itaque voluptatem expedita qui eveniet id veritatis eaque. Blanditiis quia placeat nemo. Nobis laudantium nesciunt perspiciatis sit eligendi.',
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
      description: 'Culpa aliquam consequuntur veritatis at consequuntur praesentium beatae temporibus nobis. Velit dolorem facilis neque autem. Itaque voluptatem expedita qui eveniet id veritatis eaque. Blanditiis quia placeat nemo. Nobis laudantium nesciunt perspiciatis sit eligendi.',
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

  final List<ProductModel> popularList = const [
    ProductModel(
      name: 'LG TV',
      image: AppImageAssets.LG_TV,
      price: 330,
      description: 'Culpa aliquam consequuntur veritatis at consequuntur praesentium beatae temporibus nobis. Velit dolorem facilis neque autem. Itaque voluptatem expedita qui eveniet id veritatis eaque. Blanditiis quia placeat nemo. Nobis laudantium nesciunt perspiciatis sit eligendi.',
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
      description: 'Culpa aliquam consequuntur veritatis at consequuntur praesentium beatae temporibus nobis. Velit dolorem facilis neque autem. Itaque voluptatem expedita qui eveniet id veritatis eaque. Blanditiis quia placeat nemo. Nobis laudantium nesciunt perspiciatis sit eligendi.',
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
      description: 'Culpa aliquam consequuntur veritatis at consequuntur praesentium beatae temporibus nobis. Velit dolorem facilis neque autem. Itaque voluptatem expedita qui eveniet id veritatis eaque. Blanditiis quia placeat nemo. Nobis laudantium nesciunt perspiciatis sit eligendi.',
      sizes: [
        SizeModel(size: 8, isAvailable: false),
        SizeModel(size: 10, isAvailable: false),
        SizeModel(size: 38, isAvailable: false),
        SizeModel(size: 40, isAvailable: true),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(AppImageAssets.userProfile),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hello!'),
            Text('John William'),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(AppIconAssets.notifications),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                decoration: InputDecoration(
                  prefixIcon: SvgPicture.asset(AppIconAssets.search),
                ),
              ),

              Column(children: [
                SizedBox(
                  height: 200,
                  child: CarouselSlider(
                    items: imageSliders,
                    carouselController: _controller,
                    options: CarouselOptions(
                        autoPlay: true,
                        enlargeCenterPage: true,
                        aspectRatio: 2.0,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _current = index;
                          });
                        }),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: imgList.asMap().entries.map((entry) {
                    return GestureDetector(
                      onTap: () => _controller.animateToPage(entry.key),
                      child: Container(
                        width: 12.0,
                        height: 12.0,
                        margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: (Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : Colors.black)
                                .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                      ),
                    );
                  }).toList(),
                ),
              ]),

              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Featured',
                    style: textTheme.titleMedium,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text('See All'),
                  ),
                ],
              ),
              SizedBox(
                height: 150,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    return ProductListItem(item: featuredList[index]);
                  },
                  separatorBuilder: (_, __) => const SizedBox(width: 17),
                  itemCount: featuredList.length,
                ),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Most Popular',
                    style: textTheme.titleMedium,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text('See All'),
                  ),
                ],
              ),
              SizedBox(
                height: 150,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    return ProductListItem(item: popularList[index]);
                  },
                  separatorBuilder: (_, __) => const SizedBox(width: 17),
                  itemCount: popularList.length,
                ),
              ),
            ],
          ),
        ),
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
            color: Colors.grey.shade200, borderRadius: BorderRadius.circular(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 126,
              height: 99,
              alignment: Alignment.topRight,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(item.image),
                ),
                borderRadius: BorderRadius.circular(13),
              ),
              child: IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  AppIconAssets.favourite,
                  width: 24,
                  height: 24,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
              child: Column(
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
            ),
          ],
        ),
      ),
    );
  }
}
