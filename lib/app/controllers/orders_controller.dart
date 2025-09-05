import 'package:e_commerce_app/app/data/dummy_data.dart';
import 'package:get/get.dart';

import '../data/models/order_model.dart';

class OrdersController extends GetxController {
  final tabs = ['Active', 'Completed', 'Cancel'];

  var selectedIndex = 0.obs;

  final activeOrders = <OrderModel>[].obs;
  final cancelledOrders = <OrderModel>[].obs;
  final completedOrders = <OrderModel>[].obs;

  List<OrderModel> get displayedOrders {
    switch (selectedIndex.value) {
      case 0:
        return activeOrders;
      case 1:
        return completedOrders;
      case 2:
        return cancelledOrders;
      default:
        return [];
    }
  }

  @override
  void onInit() {
    super.onInit();
    _loadOrders();
  }

  void _loadOrders() {
    activeOrders.assignAll(
        DummyData.orders.where((o) => o.status == OrderStatus.active));
    cancelledOrders.assignAll(
        DummyData.orders.where((o) => o.status == OrderStatus.cancel));
    completedOrders.assignAll(
        DummyData.orders.where((o) => o.status == OrderStatus.completed));
  }

  void changeTab(int index) {
    if (selectedIndex.value != index) {
      selectedIndex.value = index;
    }
  }
}
