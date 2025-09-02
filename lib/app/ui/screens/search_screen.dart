import 'package:e_commerce_app/app/ui/screens/product_detail.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/app_icon_assets.dart';
import '../../data/models/product_model.dart';
import 'package:flutter/material.dart' hide SearchController;
import 'package:get/get.dart';
import '../../controllers/search_controller.dart';
import '../widgets/search_product_item.dart';

class SearchScreen extends GetView<SearchController> {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 48,
        leading: RawMaterialButton(
          onPressed: () => Get.back(),
          fillColor: Colors.grey.shade200,
          padding: const EdgeInsets.only(left: 5.0),
          shape: const CircleBorder(),
          child: const Icon(Icons.arrow_back_ios, size: 24.0),
        ),
        title: TextField(
          controller: controller.searchTextController,
          onChanged: controller.filterProducts,
          decoration: const InputDecoration(
            hintText: "Search products...",
            border: InputBorder.none,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Obx(
              () => GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 17,
              crossAxisSpacing: 25,
              childAspectRatio: 1 / 1.1,
            ),
            padding: const EdgeInsets.all(15),
            itemCount: controller.filteredProducts.length,
            itemBuilder: (_, index) {
              return SearchProductItem(item: controller.filteredProducts[index]);
            },
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
