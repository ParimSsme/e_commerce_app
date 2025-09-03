import 'package:e_commerce_app/app/ui/screens/settings_screen.dart';
import 'package:e_commerce_app/core/app_icon_assets.dart';
import 'package:e_commerce_app/core/app_image_assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/profile_option.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

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
                backgroundImage: AssetImage(AppImageAssets.userProfile),
              )
                  .animate()
                  .fadeIn(duration: 600.ms)
                  .scale(begin: const Offset(0.6, 0.6), end: Offset(1, 1), curve: Curves.easeOutBack),

              const SizedBox(height: 10),

              /// Name
              Text("Mark Adam", style: textTheme.titleMedium)
                  .animate(delay: 200.ms)
                  .fadeIn(duration: 500.ms)
                  .slideY(begin: -0.2, end: 0),

              /// Email
              Text(
                "Sunny_Koelpin45@hotmail.com",
                style: textTheme.bodySmall?.copyWith(color: Colors.grey),
              )
                  .animate(delay: 400.ms)
                  .fadeIn(duration: 500.ms)
                  .slideY(begin: -0.2, end: 0),

              const SizedBox(height: 20),

              /// Profile Options (Staggered)
              ...[
                ProfileOption(
                  icon: AppIconAssets.profile,
                  label: "Profile",
                  onTap: () {},
                ),
                ProfileOption(
                  icon: AppIconAssets.setting,
                  label: "Settings",
                  onTap: () => Get.to(() => const SettingsScreen()),
                ),
                ProfileOption(
                  icon: AppIconAssets.contact,
                  label: "Contact",
                  onTap: () {},
                ),
                ProfileOption(
                  icon: AppIconAssets.share,
                  label: "Share App",
                  onTap: () {},
                ),
                ProfileOption(
                  icon: AppIconAssets.help,
                  label: "Help",
                  onTap: () {},
                ),
              ]
                  .animate(interval: 150.ms, delay: 600.ms) // stagger each option
                  .fadeIn(duration: 400.ms)
                  .slideX(begin: -0.2, end: 0),

              const Spacer(),

              /// Sign Out Button
              TextButton(
                onPressed: () {},
                child: const Text(
                  "Sign Out",
                  style: TextStyle(color: Colors.red),
                ),
              )
                  .animate(delay: 1200.ms)
                  .fadeIn(duration: 500.ms)
                  .scale(begin: const Offset(0.8, 0.8), end: Offset(1, 1))
                  .shake(hz: 3, curve: Curves.easeInOut),
            ],
          ),
        ),
      ),
    );
  }
}
