import 'package:flutter/cupertino.dart';
import 'app/routing/app_pages.dart';
import 'app/routing/app_routes.dart';
import 'package:get/get.dart';

void main() {
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
