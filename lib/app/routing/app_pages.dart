import 'package:e_commerce_app/app/bindings/cart_binding.dart';
import 'package:e_commerce_app/app/bindings/checkout_binding.dart';
import 'package:e_commerce_app/app/bindings/home_binding.dart';
import 'package:e_commerce_app/app/bindings/orders_binding.dart';
import 'package:e_commerce_app/app/bindings/products_binding.dart';
import 'package:e_commerce_app/app/bindings/search_binding.dart';
import 'package:e_commerce_app/app/bindings/settings_binding.dart';
import 'package:e_commerce_app/app/ui/screens/check_out_screen.dart';
import 'package:e_commerce_app/app/ui/screens/home_screen.dart';
import 'package:e_commerce_app/app/ui/screens/orders_screen.dart';
import 'package:e_commerce_app/app/ui/screens/product_detail.dart';
import 'package:e_commerce_app/app/ui/screens/products_screen.dart';
import 'package:e_commerce_app/app/ui/screens/search_screen.dart';
import 'package:e_commerce_app/app/ui/screens/settings_screen.dart';
import 'package:get/get.dart';
import '../ui/widgets/bottom_nav_bar.dart';
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
    GetPage(
      name: AppRoutes.settings,
      page: () => const SettingsScreen(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: AppRoutes.checkout,
      page: () => const CheckOutScreen(),
      binding: CheckoutBinding(),
    ),
    GetPage(
      name: AppRoutes.orders,
      page: () => const OrdersScreen(),
      binding: OrdersBinding(),
    ),
    GetPage(
      name: AppRoutes.products,
      page: () => const ProductsScreen(),
      binding: ProductsBinding(),
    ),
    GetPage(
      name: AppRoutes.productDetail,
      page: () {
        final product = Get.arguments;
        return ProductDetail(product: product);
      },
      binding: ProductsBinding(),
    ),
  ];
}
