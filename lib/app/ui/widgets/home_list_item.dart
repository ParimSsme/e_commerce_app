import 'package:e_commerce_app/app/ui/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../core/resources/app_icons.dart';
import '../../data/models/product_model.dart';
import '../../routing/app_routes.dart';
import '../theme/app_colors.dart';

class HomeListItem extends StatelessWidget {
  final ProductModel item;
  const HomeListItem({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(
        AppRoutes.productDetail,
        arguments: item,
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: 'product_${item.name}',
              child: Container(
                width: 126,
                height: 99,
                alignment: Alignment.topRight,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(item.image), fit: BoxFit.fill),
                  borderRadius: BorderRadius.circular(13),
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    AppIcons.favourite,
                    width: 24,
                    height: 24,
                  ),
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
            ),
          ],
        ),
      ),
    );
  }
}
