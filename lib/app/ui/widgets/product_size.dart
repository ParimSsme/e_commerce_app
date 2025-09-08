import 'package:e_commerce_app/app/ui/theme/app_text_styles.dart';
import 'package:e_commerce_app/core/resources/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../data/models/product_model.dart';
import '../theme/app_colors.dart';

class ProductSize extends StatelessWidget {
  final SizeModel item;
  const ProductSize({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return item.isAvailable
        ? Container(
            width: 44,
            height: 44,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.grey.shade400,
              ),
            ),
            child: Text(
              item.size.toString(),
              style: AppTextStyles.headlineSmall.copyWith(
                color: AppColors.black,
              ),
            ),
          )
        : SizedBox(
            width: 44,
            height: 44,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.grey.shade400,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      item.size.toString(),
                      textAlign: TextAlign.center,
                      style: AppTextStyles.headlineSmall.copyWith(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                SvgPicture.asset(
                  AppIcons.line,
                  height: 43,
                ),
              ],
            ),
          );
  }
}
