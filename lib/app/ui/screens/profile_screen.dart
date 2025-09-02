import 'package:e_commerce_app/app/ui/screens/settings_screen.dart';
import 'package:e_commerce_app/core/app_icon_assets.dart';
import 'package:e_commerce_app/core/app_image_assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/profile_option.dart';

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
              ),
              const SizedBox(height: 10),

              /// Name & Email
              Text("Mark Adam", style: textTheme.titleMedium),
              Text(
                "Sunny_Koelpin45@hotmail.com",
                style: textTheme.bodySmall?.copyWith(color: Colors.grey),
              ),
              const SizedBox(height: 20),

              /// Profile Options
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

              const Spacer(),

              /// Sign Out
              TextButton(
                onPressed: () {},
                child: const Text(
                  "Sign Out",
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
