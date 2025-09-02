import 'package:get/get.dart';
import '../data/dummy_data.dart';
import '../data/models/product_model.dart';

class ProductsController extends GetxController {

  List<ProductModel> get products => DummyData.products;

  void toggleFavourite(int index) {

  }
}
