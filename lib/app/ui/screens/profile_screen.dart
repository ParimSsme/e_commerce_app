import 'package:e_commerce_app/app/ui/theme/app_text_styles.dart';
import 'package:e_commerce_app/core/resources/app_icons.dart';
import 'package:e_commerce_app/core/resources/app_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routing/app_routes.dart';
import '../widgets/action_tile.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /// User Avatar
              const CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage(AppImages.userProfile),
              ).animate().fadeIn(duration: 600.ms).scale(
                  begin: const Offset(0.6, 0.6),
                  end: const Offset(1, 1),
                  curve: Curves.easeOutBack),

              const SizedBox(height: 10),

              /// Name
              const Text("Mark Adam", style: AppTextStyles.headingLarge)
                  .animate(delay: 200.ms)
                  .fadeIn(duration: 500.ms)
                  .slideY(begin: -0.2, end: 0),

              /// Email
              Text(
                "Sunny_Koelpin45@hotmail.com",
                style: AppTextStyles.displayMedium.copyWith(color: Colors.grey),
              )
                  .animate(delay: 400.ms)
                  .fadeIn(duration: 500.ms)
                  .slideY(begin: -0.2, end: 0),

              const SizedBox(height: 20),

              /// Profile Options (Staggered)
              ...[
                ActionTile(
                  iconPath: AppIcons.profile,
                  title: "Profile",
                  onTap: () {},
                ),
                ActionTile(
                  iconPath: AppIcons.setting,
                  title: "Settings",
                  onTap: () => Get.toNamed(AppRoutes.settings),
                ),
                ActionTile(
                  iconPath: AppIcons.contact,
                  title: "Contact",
                  onTap: () {},
                ),
                ActionTile(
                  iconPath: AppIcons.share,
                  title: "Share App",
                  onTap: () {},
                ),
                ActionTile(
                  iconPath: AppIcons.help,
                  title: "Help",
                  onTap: () {},
                ),
              ]
                  .animate(
                      interval: 150.ms, delay: 600.ms) // stagger each option
                  .fadeIn(duration: 400.ms)
                  .slideX(begin: -0.2, end: 0),

              const Spacer(),

              /// Sign Out Button
              TextButton(
                onPressed: () {},
                child: Text(
                  "Sign Out",
                  style: AppTextStyles.headlineSmall.copyWith(
                    color: Colors.red,
                  ),
                ),
              ).animate(delay: 1200.ms).fadeIn(duration: 500.ms).scale(
                    begin: const Offset(0.8, 0.8),
                    end: const Offset(1, 1),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
