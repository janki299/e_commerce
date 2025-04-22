class ProductAttributeModel {
  String? name;
  final List<String> values;

  ProductAttributeModel(this.name, this.values);

  /// Convert model to JSON format
  Map<String, dynamic> toJson() {
    return {
      'Name': name,
      'Values': values,
    };
  }

  /// Map JSON-oriented document snapshot from Firebase to Model
  factory ProductAttributeModel.fromJson(Map<String, dynamic> document) {
    if (document.isEmpty) return ProductAttributeModel('', []);

    return ProductAttributeModel(
      document.containsKey('Name') ? document['Name'] : '',
      List<String>.from(document['Values'] ?? []),
    );
  }
}
