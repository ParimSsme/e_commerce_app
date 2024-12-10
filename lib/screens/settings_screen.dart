import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../core/app_icon_assets.dart';
import '../core/app_image_assets.dart';

class SettingsScreen extends StatelessWidget {
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
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(10)),
                padding: const EdgeInsets.fromLTRB(0, 3, 13, 3),
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: const Row(
                  children: [
                    CircleAvatar(
                      radius: 24,
                      backgroundImage: AssetImage(AppImageAssets.userProfile),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Mark Adam'),
                        Text('Sunny_Koelpin45@hotmail.com'),
                      ],
                    ),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios_rounded)
                  ],
                ),
              ),
              const Divider(),
              const Text('Setting'),
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(10)),
                padding: const EdgeInsets.all(13),
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      AppIconAssets.notifications,
                      colorFilter: const ColorFilter.mode(
                        Colors.black,
                        BlendMode.srcATop,
                      ),
                    ),
                    const Text('Notification'),
                    const Spacer(),
                    const Icon(Icons.arrow_forward_ios_rounded)
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(10)),
                padding: const EdgeInsets.all(13),
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      AppIconAssets.language,
                      colorFilter: const ColorFilter.mode(
                        Colors.black,
                        BlendMode.srcATop,
                      ),
                    ),
                    const Text('Language'),
                    const Spacer(),
                    const Text('English'),
                    const Icon(Icons.arrow_forward_ios_rounded)
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(10)),
                padding: const EdgeInsets.all(13),
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      AppIconAssets.privacy,
                      colorFilter: const ColorFilter.mode(
                        Colors.black,
                        BlendMode.srcATop,
                      ),
                    ),
                    const Text('Privacy'),
                    const Spacer(),
                    const Icon(Icons.arrow_forward_ios_rounded)
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(10)),
                padding: const EdgeInsets.all(13),
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      AppIconAssets.helpCenter,
                      colorFilter: const ColorFilter.mode(
                        Colors.black,
                        BlendMode.srcATop,
                      ),
                    ),
                    const Text('Help Center'),
                    const Spacer(),
                    const Icon(Icons.arrow_forward_ios_rounded)
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(10)),
                padding: const EdgeInsets.all(13),
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      AppIconAssets.aboutUs,
                      colorFilter: const ColorFilter.mode(
                        Colors.black,
                        BlendMode.srcATop,
                      ),
                    ),
                    const Text('About us'),
                    const Spacer(),
                    const Icon(Icons.arrow_forward_ios_rounded)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}