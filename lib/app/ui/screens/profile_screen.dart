import 'package:e_commerce_app/app/ui/screens/settings_screen.dart';
import 'package:e_commerce_app/core/app_icon_assets.dart';
import 'package:e_commerce_app/core/app_image_assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
              const CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage(AppImageAssets.userProfile),
              ),
              const Text('Mark Adam'),
              const Text('Sunny_Koelpin45@hotmail.com'),
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(10)),
                padding: const EdgeInsets.all(13),
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      AppIconAssets.profile,
                      colorFilter: const ColorFilter.mode(
                        Colors.black,
                        BlendMode.srcATop,
                      ),
                    ),
                    const Text('Profile'),
                    const Spacer(),
                    const Icon(Icons.arrow_forward_ios_rounded)
                  ],
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const SettingsScreen(),
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(10)),
                  padding: const EdgeInsets.all(13),
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        AppIconAssets.setting,
                        colorFilter: const ColorFilter.mode(
                          Colors.black,
                          BlendMode.srcATop,
                        ),
                      ),
                      const Text('Setting'),
                      const Spacer(),
                      const Icon(Icons.arrow_forward_ios_rounded)
                    ],
                  ),
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
                      AppIconAssets.contact,
                      colorFilter: const ColorFilter.mode(
                        Colors.black,
                        BlendMode.srcATop,
                      ),
                    ),
                    const Text('Contact'),
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
                      AppIconAssets.share,
                      colorFilter: const ColorFilter.mode(
                        Colors.black,
                        BlendMode.srcATop,
                      ),
                    ),
                    const Text('Share App'),
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
                      AppIconAssets.help,
                      colorFilter: const ColorFilter.mode(
                        Colors.black,
                        BlendMode.srcATop,
                      ),
                    ),
                    const Text('Help'),
                    const Spacer(),
                    const Icon(Icons.arrow_forward_ios_rounded)
                  ],
                ),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {},
                child: const Text('Sign Out'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
