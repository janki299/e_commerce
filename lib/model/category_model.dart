import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  String id;
  String name;
  String image;
  String parentId;
  bool isFeatured;
  CategoryModel({
    required this.image,
    required this.id,
    required this.isFeatured,
    this.parentId = "",
    required this.name,
  });
  static CategoryModel empty() =>
      CategoryModel(image: "", id: "", isFeatured: false, name: "");

  Map<String, dynamic> toJson() {
    return {
      "Name": name,
      "Image": image,
      "ParentId": parentId,
      "IsFeatured": isFeatured,
    };
  }

  factory CategoryModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return CategoryModel(
          image: data['Image'] ?? "",
          id: document.id,
          isFeatured: data['IsFeatured'] ?? "",
          name: data['Name'] ?? "");
    } else {
      return CategoryModel.empty();
    }
  }
}
