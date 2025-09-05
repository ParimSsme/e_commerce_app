enum OrderStatus {
  active,
  completed,
  cancel,
}


class OrderModel {
  final String productName;
  final String productImage;
  final int productPrice;
  final String companyName;
  final OrderStatus status;
  const OrderModel({
    required this.productName,
    required this.productImage,
    required this.productPrice,
    required this.companyName,
    this.status = OrderStatus.active,
  });
}