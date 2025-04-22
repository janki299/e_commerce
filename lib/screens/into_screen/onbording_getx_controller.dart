import 'package:e_commerce/services/looger.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../login_screen/login_screen.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;
  void updatePageIndicator(index) {
    Logger.log("indecator check", currentPageIndex.value);
    currentPageIndex.value = index;
  }

  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpToPage(index);
  }

  void nextPage() {
    if (currentPageIndex.value < 2) {
      int nextPage = currentPageIndex.value + 1;
      currentPageIndex.value = nextPage; // Ensure state updates
      pageController.animateToPage(nextPage,
          duration: Duration(milliseconds: 300), curve: Curves.easeOutCirc);
    } else {
      final Storage = GetStorage();
      Storage.write("IsFirstTime", false);
      Get.to(() => LoginScreen());
    }
  }

  void skipPage() {
    currentPageIndex.value = 2;
    pageController.jumpToPage(2);
  }
}
