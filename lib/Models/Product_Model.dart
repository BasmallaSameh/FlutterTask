//
class ProductModel {
  String name;
  String description;
  double price;
  double reviews;
  List<String> images;

  ProductModel({
    required this.name,
    required this.description,
    required this.price,
    required this.reviews,
    required this.images,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> imageList = json['images'] ?? [];
    List<String> imageUrls = imageList.map((e) => e.toString()).toList();

    return ProductModel(
      name: json['title'] ?? '',
      description: json['description'] ?? '',
      price: json['price'] != null ? json['price'].toDouble() : 0.0,
      reviews: json['rating'] != null ? json['rating'].toDouble() : 0.0,
      images: imageUrls,
    );
  }
}
