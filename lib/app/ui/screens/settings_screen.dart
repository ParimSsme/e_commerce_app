import 'package:e_commerce_app/app/ui/widgets/action_tile.dart';
import 'package:flutter/material.dart';
import '../../../core/resources/app_icons.dart';
import '../../../core/resources/app_images.dart';
import 'package:get/get.dart';
import '../../controllers/settings_controller.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SettingsScreen extends GetView<SettingsController> {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings')
            .animate()
            .fadeIn(duration: 500.ms)
            .slideY(begin: -0.3, end: 0),
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
                        backgroundImage: AssetImage(AppImages.userProfile),
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
              )
                  .animate(delay: 200.ms)
                  .fadeIn(duration: 600.ms)
                  .scale(begin: const Offset(0.85, 0.85), end: Offset(1, 1), curve: Curves.easeOutBack),

              const Divider()
                  .animate(delay: 400.ms)
                  .fadeIn(duration: 500.ms),

              const Text('Settings')
                  .animate(delay: 500.ms)
                  .fadeIn(duration: 500.ms)
                  .slideX(begin: -0.2, end: 0),

              const SizedBox(height: 10),

              ...[
                ActionTile(
                  iconPath: AppIcons.notifications,
                  title: "Notification",
                  onTap: controller.onNotificationTap,
                ),
                ActionTile(
                  iconPath: AppIcons.language,
                  title: "Language",
                  trailing: const Text("English"),
                  onTap: controller.onLanguageTap,
                ),
                ActionTile(
                  iconPath: AppIcons.privacy,
                  title: "Privacy",
                  onTap: controller.onPrivacyTap,
                ),
                ActionTile(
                  iconPath: AppIcons.helpCenter,
                  title: "Help Center",
                  onTap: controller.onHelpTap,
                ),
                ActionTile(
                  iconPath: AppIcons.aboutUs,
                  title: "About Us",
                  onTap: controller.onAboutTap,
                ),
              ]
                  .animate(interval: 150.ms, delay: 700.ms)
                  .fadeIn(duration: 500.ms)
                  .slideX(begin: -0.3, end: 0),
            ],
          ),
        ),
      ),
    );
  }
}

