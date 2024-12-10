class ProductModel {
  final String name;
  final String image;
  final int price;
  final double rate;
  final int reviewCount;
  final String description;
  final List<SizeModel> sizes;
  const ProductModel({
    required this.name,
    required this.image,
    required this.price,
    this.rate = 0.0,
    this.reviewCount = 0,
    required this.description,
    required this.sizes,
  });
}

class SizeModel {
  final int size;
  final bool isAvailable;
  const SizeModel({
    required this.size,
    required this.isAvailable,
  });
}
