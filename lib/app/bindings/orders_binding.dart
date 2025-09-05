import 'package:e_commerce_app/app/controllers/orders_controller.dart';
import 'package:get/get.dart';

class OrdersBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(OrdersController());
  }
}