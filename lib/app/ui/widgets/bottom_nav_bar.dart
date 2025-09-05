import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/resources/app_icons.dart';
import '../screens/cart_screen.dart';
import '../screens/home_screen.dart';
import '../screens/profile_screen.dart';
import '../screens/search_screen.dart';

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
      iconPath: AppIcons.home,
      label: 'home',
    ),
    _TabItem(
      screen: const SearchScreen(),
      iconPath: AppIcons.search,
      label: 'search',
    ),
    _TabItem(
      screen: const CartScreen(),
      iconPath: AppIcons.cart,
      label: 'cart',
    ),
    _TabItem(
      screen: const ProfileScreen(),
      iconPath: AppIcons.profile,
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
