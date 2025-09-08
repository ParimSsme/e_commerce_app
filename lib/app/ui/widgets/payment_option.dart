import 'package:e_commerce_app/app/ui/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../theme/app_colors.dart';

class PaymentOption extends StatelessWidget {
  final String icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const PaymentOption({
    super.key,
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Row(
        children: [
          SizedBox(
            width: 24,
            height: 24,
            child: SvgPicture.asset(
              icon,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            label,
            style: AppTextStyles.displayLarge.copyWith(
              color:
                  isSelected ? AppColors.textPrimary : AppColors.textSecondary,
            ),
          ),
          const Spacer(),
          _CustomRadio(
            isSelected: isSelected,
            onTap: onTap,
          ),
        ],
      ),
    );
  }
}

class _CustomRadio extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onTap;

  const _CustomRadio({
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 24,
        height: 24,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.secondary,
        ),
        child: isSelected
            ? const Icon(Icons.check, size: 20, color: AppColors.primary)
            : null,
      ),
    );
  }
}
