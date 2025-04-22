import 'package:e_commerce/controller/user_controller.dart';
import 'package:e_commerce/data/user/user_repository.dart';
import 'package:e_commerce/screens/lodder.dart';
import 'package:e_commerce/screens/settings_screen/settings_screen.dart';
import 'package:e_commerce/services/looger.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../services/network_manager.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    initializeName();
    super.onInit();
  }

  Future<void> initializeName() async {
    if (UserController.instance.user.value != null) {
      firstName.text = userController.user.value.firstName;
      lastName.text = userController.user.value.lastName;
    }
  }

  Future<void> updateUserName() async {
    try {
      FullScreenLoader.showLoadingDialog(
        "We are updating your information...",
        "assets/images/animation.json",
      );

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.hideLoadingDialog();
        return;
      }

      if (updateUserNameFormKey.currentState == null ||
          !updateUserNameFormKey.currentState!.validate()) {
        Logger.log("UserController user is null before update", '');
        FullScreenLoader.hideLoadingDialog();
        return;
      }

      Map<String, dynamic> name = {
        "FirstName": firstName.text.trim(),
        "LastName": lastName.text.trim()
      };
      Logger.log("name", name);
      await userRepository.updateSingleValue(name);

      if (userController.user.value == null) {
        FullScreenLoader.hideLoadingDialog();
        return;
      }

      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      FullScreenLoader.hideLoadingDialog();
      FullScreenLoader.successSnackBar(
          title: "Congratulations", message: "Your name has been updated");

      Get.off(() => SettingsScreen());
    } catch (e) {
      FullScreenLoader.hideLoadingDialog();
      Logger.log("Catch error of Update name", e.toString());
    }
  }

  @override
  void onClose() {
    firstName.dispose();
    lastName.dispose();
    super.onClose();
  }
}
