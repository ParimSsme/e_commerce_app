import 'package:e_commerce_app/app/controllers/products_controller.dart';
import 'package:get/get.dart';

class ProductsBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ProductsController());
  }
}