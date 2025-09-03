import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingsItem extends StatelessWidget {
  final String iconPath;
  final String title;
  final Widget? trailing;
  final VoidCallback? onTap;

  const SettingsItem({
    super.key,
    required this.iconPath,
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
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(13),
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            SvgPicture.asset(
              iconPath,
              colorFilter: const ColorFilter.mode(
                Colors.black,
                BlendMode.srcATop,
              ),
            ),
            const SizedBox(width: 10),
            Text(title),
            const Spacer(),
            if (trailing != null) trailing!,
            const Icon(Icons.arrow_forward_ios_rounded),
          ],
        ),
      ),
    );
  }
}
