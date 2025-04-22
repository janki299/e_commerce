import 'package:e_commerce/services/looger.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();
  final isLoading = false.obs;
  @override
  void onInit() {
    fetchFeaturedProduct();
    super.onInit();
  }

  void fetchFeaturedProduct() async {
    try {
      isLoading.value = true;
      // Logger.log("value after print", );
    } catch (e) {
      Logger.log("on catch valu fetchFeaturedProduct", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
