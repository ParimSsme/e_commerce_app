class CartModel {
  final String productName;
  final String productImage;
  final int productPrice;
  final String companyName;
  final int productCount;
  const CartModel({
    required this.productName,
    required this.productImage,
    required this.productPrice,
    required this.companyName,
    this.productCount = 0,
  });
}
