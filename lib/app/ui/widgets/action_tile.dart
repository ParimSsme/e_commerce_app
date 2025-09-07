import 'package:e_commerce_app/app/ui/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../theme/app_colors.dart';

class ActionTile extends StatelessWidget {
  final String? iconPath;
  final String title;
  final Widget? trailing;
  final VoidCallback? onTap;

  const ActionTile({
    super.key,
    this.iconPath,
    required this.title,
    this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.secondary,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(13),
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            if (iconPath != null) ...[
              SvgPicture.asset(
                iconPath!,
                colorFilter: const ColorFilter.mode(
                  Colors.black,
                  BlendMode.srcATop,
                ),
              ),
              const SizedBox(width: 10),
            ],
            Text(
              title,
              style: AppTextStyles.headlineSmall,
            ),
            const Spacer(),
            if (trailing != null) trailing!,
            const Icon(Icons.arrow_forward_ios_rounded, size: 25),
          ],
        ),
      ),
    );
  }
}


