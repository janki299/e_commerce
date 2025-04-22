import 'package:e_commerce/services/looger.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../data/repositories/authentication_repository.dart';
import '../screens/lodder.dart';
import '../services/network_manager.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();
  final rememberMe = false.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  final checkBoxChecked = false.obs;
  GlobalKey<FormState> loginKey = GlobalKey<FormState>();

  @override
  void onInit() {
    // if (localStorage.read("REMEMBER_ME_EMAIL").toString() != "") {
    //   email.text = localStorage.read("REMEMBER_ME_EMAIL");
    //   password.text = localStorage.read("REMEMBER_ME_Password");
    // }

    super.onInit();
  }

  Future<void> signinWithGoogle() async {
    try {
      FullScreenLoader.showLoadingDialog(
        "connectin..",
        "assets/images/animation.json",
      );
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.hideLoadingDialog();
        return;
      }
      final userCredentials =
          await AuthenticationRepository.instance.signinWithGoogle();
      FullScreenLoader.hideLoadingDialog();
      AuthenticationRepository.instance.screenRedirect();
      Logger.log("userCredentials with google", userCredentials);
    } catch (e) {
      FullScreenLoader.hideLoadingDialog();
      Logger.log("error ongoogle login", e.toString());
    }
  }

  Future<void> emailAndPasswordSignIn() async {
    try {
      FullScreenLoader.showLoadingDialog(
        "We are processing your information",
        "assets/images/animation.json",
      );

      // Check Internet Connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.hideLoadingDialog();
        return;
      }

      if (checkBoxChecked.value) {
        localStorage.write("REMEMBER_ME_EMAIL", email.text.trim());
        localStorage.write("REMEMBER_ME_Password", password.text.trim());
      }
      // Validate Form
      if (!loginKey.currentState!.validate()) {
        FullScreenLoader.hideLoadingDialog();
        return; // If form is invalid, exit function
      }

      // Register User
      final userCredentials = await AuthenticationRepository.instance
          .loginUserWithEmailAndPassword(
              email.text.trim(), password.text.trim());
      Logger.log("userCredentials", userCredentials);
      FullScreenLoader.hideLoadingDialog();
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      FullScreenLoader.hideLoadingDialog();
      Logger.log("0on lgn", e.toString());
      FullScreenLoader.warningSnackBar(title: "Oh snap", message: e.toString());
    } finally {
      // FullScreenLoader
      //     .hideLoadingDialog(); // Ensures loader is hidden in all cases
    }
  }
}
