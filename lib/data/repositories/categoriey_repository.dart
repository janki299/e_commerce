import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/model/category_model.dart';
import 'package:e_commerce/services/looger.dart';
import 'package:get/get.dart';

class CategorieyRepository extends GetxController {
  static CategorieyRepository get instance => Get.find();
  final _db = FirebaseFirestore.instance;
  // final _db = Supabase.instance.client;

  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final snapshot = await _db.collection("Categories").get();

      final list = snapshot.docs
          .map((e) => CategoryModel.fromSnapshot(
              e as DocumentSnapshot<Map<String, dynamic>>))
          .toList();
      return list;
    } catch (e) {
      Logger.log("catch error on list of categories", e.toString());
      return [];
    }
  }
}
