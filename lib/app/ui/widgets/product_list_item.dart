import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../core/resources/app_icons.dart';
import '../../data/models/product_model.dart';
import '../screens/product_detail.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import 'circle_icon_button.dart';

class ProductListItem extends StatelessWidget {
  final ProductModel item;
  final VoidCallback onFavouriteToggle;

  const ProductListItem({
    super.key,
    required this.item,
    required this.onFavouriteToggle,
  });

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () => Get.to(
            () => ProductDetail(product: item),
        transition: Transition.fadeIn,
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: "product_${item.name}",
              child: Container(
                width: double.infinity,
                height: 134,
                alignment: Alignment.topRight,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13),
                  image: DecorationImage(
                    image: AssetImage(item.image),
                    fit: BoxFit.cover,
                  ),
                ),
                child: IconButton(
                  onPressed: onFavouriteToggle,
                  icon: SvgPicture.asset(
                    item.isFavourite
                        ? AppIcons.favouriteFilled
                        : AppIcons.favourite,
                    width: 24,
                    height: 24,
                  ),
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
                        style: AppTextStyles.headlineSmall.copyWith(
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        '\$${item.price}',
                        style: AppTextStyles.headlineSmall.copyWith(
                          color: AppColors.primary,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  CircleIconButton(
                    size: 25,
                    iconSize: 25,
                    backgroundColor: AppColors.primary,
                    onPressed: () {},
                    icon: Icons.add,
                    iconColor: AppColors.onPrimary,
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
