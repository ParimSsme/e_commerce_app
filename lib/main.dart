import 'package:e_commerce_app/core/app_icon_assets.dart';
import 'package:e_commerce_app/screens/cart_screen.dart';
import 'package:e_commerce_app/screens/home_screen.dart';
import 'package:e_commerce_app/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: MainWrapper(),
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

  static const List<Widget> _pages = <Widget>[
    HomeScreen(),
    Icon(
      Icons.camera,
      size: 150,
    ),
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
