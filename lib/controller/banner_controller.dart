import 'package:e_commerce/data/repositories/banner_repository.dart';
import 'package:e_commerce/services/looger.dart';
import 'package:get/get.dart';

import '../model/banner_model.dart';

class BannerController extends GetxController {
  static BannerController get instance => Get.find();
  final dotIndex = 0.obs;
  final isLoading = false.obs;
  final RxList<BannerModel> banners = <BannerModel>[].obs;
  void imageUpdate(index) {
    dotIndex.value = index;
  }

  @override
  void onInit() {
    fetchBanner();
    super.onInit();
  }

  Future<void> fetchBanner() async {
    try {
      isLoading.value = true;
      final bannerRepo = Get.put(BannerRepository());
      final banners = await bannerRepo.fetchBanners();
      Logger.log("banners list print", banners.first.imageUrl);
      this.banners.assignAll(banners);
    } catch (e) {
      Logger.log("logs check for error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
