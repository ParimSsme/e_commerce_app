import 'package:e_commerce_app/app/controllers/search_controller.dart';
import 'package:get/get.dart';

class SearchBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SearchController());
  }
}