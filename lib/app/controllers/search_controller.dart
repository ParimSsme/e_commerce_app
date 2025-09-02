import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../data/dummy_data.dart';
import '../data/models/product_model.dart';

class SearchController extends GetxController {
  final searchTextController = TextEditingController();

  List<ProductModel> get products => DummyData.products;

  // Filtered products list
  final filteredProducts = <ProductModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    filteredProducts.assignAll(products); // show all by default
  }

  void filterProducts(String query) {
    if (query.isEmpty) {
      filteredProducts.assignAll(products);
    } else {
      filteredProducts.assignAll(
        products.where(
              (p) => p.name.toLowerCase().contains(query.toLowerCase()),
        ),
      );
    }
  }
}
