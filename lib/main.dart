import 'package:e_commerce_app/core/app_icon_assets.dart';
import 'package:flutter/material.dart' hide SearchController;
import 'package:flutter_svg/flutter_svg.dart';
import 'app/controllers/home_controller.dart';
import 'app/controllers/search_controller.dart';
import 'app/routing/app_pages.dart';
import 'app/routing/app_routes.dart';
import 'app/ui/screens/cart_screen.dart';
import 'app/ui/screens/home_screen.dart';
import 'app/ui/screens/profile_screen.dart';
import 'app/ui/screens/search_screen.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    Get.put(SearchController());

    return GetMaterialApp(
      title: 'E-Commerce app',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.tabs,
      getPages: AppPages.pages,
    );
  }
}

class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key});

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  int selectedTab = 0;

  static final List<Widget> _pages = <Widget>[
    HomeScreen(),
    SearchScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[selectedTab],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedTab,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          setState(() {
            selectedTab = index;
          });
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppIconAssets.home,
              colorFilter: ColorFilter.mode(
                selectedTab == 0 ? const Color(0xff6055d8) : Colors.grey,
                BlendMode.srcATop,
              ),
            ),
            label: 'home'
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppIconAssets.search,
              colorFilter: ColorFilter.mode(
                selectedTab == 1 ? const Color(0xff6055d8) : Colors.grey,
                BlendMode.srcATop,
              ),
            ),
            label: 'search'
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppIconAssets.cart,
              colorFilter: ColorFilter.mode(
                selectedTab == 2 ? const Color(0xff6055d8) : Colors.grey,
                BlendMode.srcATop,
              ),
            ),
            label: 'search'
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppIconAssets.profile,
              colorFilter: ColorFilter.mode(
                selectedTab == 3 ? const Color(0xff6055d8) : Colors.grey,
                BlendMode.srcATop,
              ),
            ),
            label: 'profile'
          ),
        ],
      ),
    );
  }
}
