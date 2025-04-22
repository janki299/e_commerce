class BrandModel {
  String id;
  String name;
  String image;
  bool? isFeatured;
  int? productsCount;

  BrandModel({
    required this.id,
    required this.image,
    required this.name,
    this.isFeatured,
    this.productsCount,
  });

  /// Empty Helper Function
  static BrandModel empty() => BrandModel(id: '', image: '', name: '');

  /// Convert model to JSON structure so that you can store data in Firebase
  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'Name': name,
      'Image': image,
      'ProductsCount': productsCount,
      'IsFeatured': isFeatured,
    };
  }

  /// Map JSON-oriented document snapshot from Firebase to BrandModel
  factory BrandModel.fromJson(Map<String, dynamic> document) {
    if (document.isEmpty) return BrandModel.empty();

    return BrandModel(
      id: document['Id'] ?? '',
      name: document['Name'] ?? '',
      image: document['Image'] ?? '',
      productsCount: document['ProductsCount'] ?? 0,
      isFeatured: document['IsFeatured'] ?? false,
    );
  }
}
