import 'package:get/get.dart';
import '../data/dummy_data.dart';
import '../data/models/product_model.dart';

class HomeController extends GetxController {


  var currentCarouselIndex = 0.obs;

  List<ProductModel> get featuredList => DummyData.featuredList;
  List<ProductModel> get popularList => DummyData.popularList;


  void changeIndex(int index) {
    currentCarouselIndex.value = index;
  }
}
