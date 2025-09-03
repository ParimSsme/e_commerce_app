import 'package:e_commerce_app/app/bindings/cart_binding.dart';
import 'package:e_commerce_app/app/bindings/home_binding.dart';
import 'package:e_commerce_app/app/bindings/search_binding.dart';
import 'package:e_commerce_app/app/ui/screens/home_screen.dart';
import 'package:e_commerce_app/app/ui/screens/search_screen.dart';
import 'package:get/get.dart';
import '../../main.dart';
import 'app_routes.dart';

class AppPages {

  static final pages = [
    GetPage(
      name: AppRoutes.tabs,
      page: () => const MainWrapper(),
      bindings: [
        HomeBinding(),
        SearchBinding(),
        CartBinding(),
      ],
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.search,
      page: () => const SearchScreen(),
      binding: SearchBinding(),
    ),

  ];
}
