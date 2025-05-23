// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:e_commerce/model/product_attribute_model.dart';
// import 'package:e_commerce/model/product_variat_model.dart';
//
// import 'brand_model.dart';
//
// class ProductModel {
//   String id;
//   int stock;
//   String? sku;
//   double price;
//   String title;
//   DateTime? date;
//   double salePrice;
//   String thumbnail;
//   bool? isFeatured;
//   BrandModel? brand;
//   String? description;
//   String? categoryId;
//   List<String>? images;
//   String? productType;
//   List<ProductAttributeModel>? productAttributes;
//   List<ProductVariationModel>? productVariations;
//
//   ProductModel({
//     required this.id,
//     required this.stock,
//     this.sku,
//     required this.price,
//     required this.title,
//     this.date,
//     this.isFeatured,
//     required this.thumbnail,
//     this.brand,
//     this.description,
//     this.categoryId,
//     this.images,
//     this.productType,
//     this.productAttributes,
//     this.productVariations,
//     this.salePrice = 0.0,
//   });
//   static ProductModel empty() =>
//       ProductModel(id: "", stock: 0, price: 0, title: "", thumbnail: "");
//   toJson() {
//     return {
//       'SKU': sku,
//       "Title": title,
//       "Stock": stock,
//       "Price": price,
//       "Image": images ?? [],
//       "Thumbnail": thumbnail,
//       "SalePrice": salePrice,
//       "IsFeatured": isFeatured,
//       "CategoryId": categoryId,
//       "Brand": brand!.toJson(),
//       "Description": description,
//       "ProductType": productType,
//       "ProductAttributes": productAttributes != null
//           ? productAttributes!
//               .map(
//                 (e) => e.toJson(),
//               )
//               .toList()
//           : [],
//       "ProductVariations": productVariations != null
//           ? productVariations!
//               .map(
//                 (e) => e.toJson(),
//               )
//               .toList()
//           : [],
//     };
//   }
//
//   factory ProductModel.fromSnapshot(
//       DocumentSnapshot<Map<String, dynamic>> document) {
//     final data = document.data()!;
//     return ProductModel(
//       id: document.id,
//       sku: data['SKU'] ?? '',
//       title: data['Title'] ?? '',
//       stock: data['Stock'] ?? 0,
//       isFeatured: data['IsFeatured'] ?? false,
//       price: double.parse((data['Price'] ?? 0.0).toString()),
//       salePrice: double.parse((data['SalePrice'] ?? 0.0).toString()),
//       thumbnail: data['Thumbnail'] ?? '',
//       categoryId: data['CategoryId'] ?? '',
//       description: data['Description'] ?? '',
//       productType: data['ProductType'] ?? '',
//       brand: BrandModel.fromJson(data['Brand']),
//       images: data['Images'] != null ? List<String>.from(data['Images']) : [],
//       productAttributes: (data['ProductAttributes'] as List<dynamic>?)
//               ?.map((e) => ProductAttributeModel.fromJson(e))
//               .toList() ??
//           [],
//       productVariations: (data['ProductVariations'] as List<dynamic>?)
//               ?.map((e) => ProductVariationModel.fromJson(e))
//               .toList() ??
//           [],
//     );
//   }
// }
