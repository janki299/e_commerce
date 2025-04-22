import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/data/firebase_storage_services.dart';
import 'package:e_commerce/model/category_model.dart';
import 'package:e_commerce/services/looger.dart';
import 'package:get/get.dart';

import '../data/repositories/categoriey_repository.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();
  final _categoryRepository = Get.put(CategorieyRepository());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;
  final isLoading = false.obs;
  final _db = FirebaseFirestore.instance;
  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  Future<void> fetchCategories() async {
    try {
      isLoading.value = true;
      final categories = await _categoryRepository.getAllCategories();
      allCategories.assignAll(categories);
      featuredCategories.assignAll(
        allCategories
            .where(
                (category) => category.isFeatured && category.parentId.isEmpty)
            .take(8)
            .toList(),
      );
    } catch (e) {
      Logger.log("catch error on fetching categories", e.toString());
    } finally {
      isLoading.value = false; // ✅ Set it back to false here
    }
  }

  Future<void> uploadDummyData(List<CategoryModel> categories) async {
    try {
      final storage = Get.put(TFirebaseStorageService());
      for (var category in categories) {
        final file = await storage.getImageDataFromAssets(category.image);
        final url =
            await storage.uploadImageData("Categories", file, category.name);
        category.image = url;
        await _db
            .collection("Categories")
            .doc(category.id)
            .set(category.toJson());
      }
    } catch (e) {
      Logger.log("catch error on fetching categories", e.toString());
    } finally {
      isLoading.value = false; // ✅ Set it back to false here
    }
  }
}
