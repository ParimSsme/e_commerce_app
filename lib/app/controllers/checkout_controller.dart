import 'package:get/get.dart';
import '../../core/resources/app_icons.dart';
import '../routing/app_routes.dart';

class PaymentMethod {
  final String name;
  final String icon;
  PaymentMethod({required this.name, required this.icon});
}

class CheckoutController extends GetxController {
  var itemCount = 3.obs;
  var subtotal = 423.0.obs;
  var discount = 4.0.obs;
  var deliveryCharge = 2.0.obs;

  double get total => subtotal.value - discount.value + deliveryCharge.value;

  // Payment methods
  var paymentMethods = <PaymentMethod>[
    PaymentMethod(name: 'Paypal', icon: AppIcons.paypal),
    PaymentMethod(name: 'Credit Card', icon: AppIcons.creditCard),
    PaymentMethod(name: 'Cash', icon: AppIcons.cash),
  ].obs;

  var selectedPayment = ''.obs;

  void selectPayment(String method) {
    selectedPayment.value = method;
  }

  void addPaymentMethod() {
    // Handle adding new payment method
  }

  void onCheckout() => Get.toNamed(AppRoutes.orders);

}
