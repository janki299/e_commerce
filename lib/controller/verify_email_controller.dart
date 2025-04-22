import 'dart:async';

import 'package:e_commerce/data/repositories/authentication_repository.dart';
import 'package:e_commerce/screens/lodder.dart';
import 'package:e_commerce/screens/signup_screen/success_screen.dart';
import 'package:e_commerce/services/looger.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  @override
  void onInit() {
    super.onInit();
    sendEmailVerification();
  }

  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      FullScreenLoader.successSnackBar(
          title: "Email Sent",
          message: "Please check Your inbox to verify your email ");
    } catch (e) {
      FullScreenLoader.warningSnackBar(title: "ERROR", message: e.toString());
    }
  }

  seTimerForAutoRedirect() {
    Timer.periodic(
      Duration(seconds: 1),
      (timer) async {
        await FirebaseAuth.instance.currentUser?.reload();
        final user = FirebaseAuth.instance.currentUser;
        if (user?.emailVerified ?? false) {
          timer.cancel();
          Get.off(() => SuccessScreen(
                statusText: "",
                statusTitle: "",
                image: "assets/images/communicating.dart",
                onContinueTap: () =>
                    AuthenticationRepository.instance.screenRedirect(),
              ));
        }
      },
    );
  }

  checkEmailVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    await currentUser?.reload();
    if (currentUser != null && currentUser.emailVerified) {
      Get.off(() => SuccessScreen(
            statusText: "sdwdd",
            statusTitle: "dxsdsdsd",
            image: "assets/images/communicating.dart",
            onContinueTap: () =>
                AuthenticationRepository.instance.screenRedirect(),
          ));
    } else {
      Logger.log("not verifyes", currentUser);
    }
  }
}
