import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../core/app_icon_assets.dart';
import '../../routing/app_pages.dart';
import '../../routing/app_routes.dart';
import '../screens/cart_screen.dart';
import '../screens/home_screen.dart';
import '../screens/profile_screen.dart';
import '../screens/search_screen.dart';

// Import your app-specific files
// import 'controllers/search_controller.dart';
// import 'routes/app_routes.dart';
// import 'routes/app_pages.dart';
// import 'screens/home_screen.dart';
// import 'screens/search_screen.dart';
// import 'screens/cart_screen.dart';
// import 'screens/profile_screen.dart';
// import 'assets/app_icon_assets.dart';

void main() {
  // Inject dependencies before runApp
  Get.put(SearchController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'E-Commerce App',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.tabs,
      getPages: AppPages.pages,
    );
  }
}


// class _MainWrapperState extends State<MainWrapper> {
//   int selectedTab = 0;
//
//   static final List<Widget> _pages = <Widget>[
//
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _pages[selectedTab],
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: selectedTab,
//         showSelectedLabels: false,
//         showUnselectedLabels: false,
//         type: BottomNavigationBarType.fixed,
//         onTap: (int index) {
//           setState(() {
//             selectedTab = index;
//           });
//         },
//         items: <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//               icon: SvgPicture.asset(
//                 AppIconAssets.home,
//                 colorFilter: ColorFilter.mode(
//                   selectedTab == 0 ? const Color(0xff6055d8) : Colors.grey,
//                   BlendMode.srcATop,
//                 ),
//               ),
//               label: 'home'
//           ),
//           BottomNavigationBarItem(
//               icon: SvgPicture.asset(
//                 AppIconAssets.search,
//                 colorFilter: ColorFilter.mode(
//                   selectedTab == 1 ? const Color(0xff6055d8) : Colors.grey,
//                   BlendMode.srcATop,
//                 ),
//               ),
//               label: 'search'
//           ),
//           BottomNavigationBarItem(
//               icon: SvgPicture.asset(
//                 AppIconAssets.cart,
//                 colorFilter: ColorFilter.mode(
//                   selectedTab == 2 ? const Color(0xff6055d8) : Colors.grey,
//                   BlendMode.srcATop,
//                 ),
//               ),
//               label: 'search'
//           ),
//           BottomNavigationBarItem(
//               icon: SvgPicture.asset(
//                 AppIconAssets.profile,
//                 colorFilter: ColorFilter.mode(
//                   selectedTab == 3 ? const Color(0xff6055d8) : Colors.grey,
//                   BlendMode.srcATop,
//                 ),
//               ),
//               label: 'profile'
//           ),
//         ],
//       ),
//     );
//   }
// }

class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key});

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  int _selectedIndex = 0;

  final List<_TabItem> _tabs = [
    _TabItem(
      screen: const HomeScreen(),
      iconPath: AppIconAssets.home,
      label: 'home',
    ),
    _TabItem(
      screen: const SearchScreen(),
      iconPath: AppIconAssets.search,
      label: 'search',
    ),
    _TabItem(
      screen: const CartScreen(),
      iconPath: AppIconAssets.cart,
      label: 'cart',
    ),
    _TabItem(
      screen: const ProfileScreen(),
      iconPath: AppIconAssets.profile,
      label: 'profile',
    ),
  ];

  void _onTabTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabs[_selectedIndex].screen,
      bottomNavigationBar: _BottomNavBar(
        tabs: _tabs,
        selectedIndex: _selectedIndex,
        onTap: _onTabTapped,
      ),
    );
  }
}

/// -----------------
/// Helpers
/// -----------------

class _TabItem {
  final Widget screen;
  final String iconPath;
  final String label;

  _TabItem({
    required this.screen,
    required this.iconPath,
    required this.label,
  });
}

class _BottomNavBar extends StatelessWidget {
  const _BottomNavBar({
    required this.tabs,
    required this.selectedIndex,
    required this.onTap,
  });

  final List<_TabItem> tabs;
  final int selectedIndex;
  final ValueChanged<int> onTap;

  static const Color activeColor = Color(0xff6055d8);
  static const Color inactiveColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
      onTap: onTap,
      items: tabs.asMap().entries.map((entry) {
        final index = entry.key;
        final tab = entry.value;
        final isSelected = index == selectedIndex;
        return BottomNavigationBarItem(
          icon: SvgPicture.asset(
            tab.iconPath,
            colorFilter: ColorFilter.mode(
              isSelected ? activeColor : inactiveColor,
              BlendMode.srcATop,
            ),
          ),
          label: tab.label,
        );
      }).toList(),
    );
  }
}
