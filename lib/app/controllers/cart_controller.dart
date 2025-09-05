import 'package:get/get.dart';
import '../../core/resources/app_images.dart';
import '../data/models/cart_model.dart';

class CartController extends GetxController {
  var carts = <CartModel>[
    const CartModel(
      productName: 'Watch',
      productImage: AppImages.watch,
      productPrice: 40,
      companyName: 'Rolex',
      productCount: 2,
    ),
    const CartModel(
      productName: 'Airpods',
      productImage: AppImages.airpods,
      productPrice: 333,
      companyName: 'Apple',
      productCount: 2,
    ),
    const CartModel(
      productName: 'Hoodie',
      productImage: AppImages.hoodie,
      productPrice: 50,
      companyName: 'Puma',
      productCount: 2,
    ),
  ].obs;

  // Cart operations
  void removeFromCart(CartModel item) => carts.remove(item);

  void increaseQuantity(CartModel item) {
    final index = carts.indexOf(item);
    if (index != -1) {
      // carts[index] = carts[index].copyWith(
      //   productCount: carts[index].productCount + 1,
      // );
    }
  }

  void decreaseQuantity(CartModel item) {
    final index = carts.indexOf(item);
    if (index != -1 && carts[index].productCount > 1) {
      // carts[index] = carts[index].copyWith(
      //   productCount: carts[index].productCount - 1,
      // );
    }
  }

  // Order summary calculations
  int get totalItems => carts.fold(0, (sum, item) => sum + item.productCount);

  double get subtotal =>
      carts.fold(0, (sum, item) => sum + (item.productPrice * item.productCount));

  double get discount => 4; // static for now

  double get deliveryCharge => 2; // static for now

  double get total => subtotal - discount + deliveryCharge;

  void onMenuPressed() {
    // Handle menu options
  }
}
