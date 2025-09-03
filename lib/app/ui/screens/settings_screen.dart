import 'package:flutter/material.dart';
import '../../../core/app_icon_assets.dart';
import '../../../core/app_image_assets.dart';
import 'package:get/get.dart';
import '../../controllers/settings_controller.dart';
import '../widgets/settings_item.dart';

class SettingsScreen extends GetView<SettingsController> {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Header
              GestureDetector(
                onTap: controller.onProfileTap,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.fromLTRB(0, 3, 13, 3),
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: const Row(
                    children: [
                      CircleAvatar(
                        radius: 24,
                        backgroundImage: AssetImage(AppImageAssets.userProfile),
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Mark Adam'),
                          Text('Sunny_Koelpin45@hotmail.com'),
                        ],
                      ),
                      Spacer(),
                      Icon(Icons.arrow_forward_ios_rounded),
                    ],
                  ),
                ),
              ),

              const Divider(),
              const Text('Settings'),

              // Settings Items
              SettingsItem(
                iconPath: AppIconAssets.notifications,
                title: "Notification",
                onTap: controller.onNotificationTap,
              ),
              SettingsItem(
                iconPath: AppIconAssets.language,
                title: "Language",
                trailing: const Text("English"),
                onTap: controller.onLanguageTap,
              ),
              SettingsItem(
                iconPath: AppIconAssets.privacy,
                title: "Privacy",
                onTap: controller.onPrivacyTap,
              ),
              SettingsItem(
                iconPath: AppIconAssets.helpCenter,
                title: "Help Center",
                onTap: controller.onHelpTap,
              ),
              SettingsItem(
                iconPath: AppIconAssets.aboutUs,
                title: "About Us",
                onTap: controller.onAboutTap,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
