import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileOption extends StatelessWidget {
  final String icon;
  final String label;
  final VoidCallback onTap;

  const ProfileOption({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
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
              icon,
              colorFilter: const ColorFilter.mode(
                Colors.black,
                BlendMode.srcATop,
              ),
            ),
            const SizedBox(width: 10),
            Text(label),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios_rounded, size: 18),
          ],
        ),
      ),
    );
  }
}
