import 'package:e_commerce/data/repositories/authentication_repository.dart';
import 'package:e_commerce/screens/forgotPassword_screen/reset_password_screen.dart';
import 'package:e_commerce/screens/lodder.dart';
import 'package:e_commerce/services/looger.dart';
import 'package:e_commerce/services/network_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  static ForgotPasswordController get instance => Get.find();

  final email = TextEditingController();
  GlobalKey<FormState> forgotPasswordKey = GlobalKey<FormState>();

  sendPasswordResetEmail() async {
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
      if (!forgotPasswordKey.currentState!.validate()) {
        FullScreenLoader.hideLoadingDialog();
        return;
      }

      await AuthenticationRepository.instance
          .sendPasswordResetEmail(email.text.trim());
      FullScreenLoader.hideLoadingDialog();
      Get.to(() => ResetPasswordScreen(email: email.text.trim()));
    } catch (e) {
      FullScreenLoader.hideLoadingDialog();
      Logger.log("error on forgotpassword", e.toString());
    }
  }

  resendPasswordResetEmail(String email) async {
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
      FullScreenLoader.hideLoadingDialog();
      await AuthenticationRepository.instance.sendPasswordResetEmail(email);
      FullScreenLoader.hideLoadingDialog();
    } catch (e) {
      FullScreenLoader.hideLoadingDialog();
      Logger.log(
          "error on forgotpassword resendPasswordResetEmail", e.toString());
    }
  }
}
