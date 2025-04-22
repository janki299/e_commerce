import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/model/banner_model.dart';
import 'package:get/get.dart';

class BannerRepository extends GetxController {
  static BannerRepository get instance => Get.find();
  final _db = FirebaseFirestore.instance;
  Future<List<BannerModel>> fetchBanners() async {
    try {
      final result =
          await _db.collection("Banner").where("Active", isEqualTo: true).get();
      return result.docs.map((e) => BannerModel.fromSnapshot(e)).toList();
    } catch (e) {
      throw "catch error on ${e.toString()}";
    }
  }
}
