import 'package:e_commerce/data/repositories/authentication_repository.dart';
import 'package:e_commerce/data/user/user_repository.dart';
import 'package:e_commerce/screens/lodder.dart';
import 'package:e_commerce/screens/signup_screen/verify_email_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../data/user/user_model.dart';
import '../services/network_manager.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  final hidePassword = true.obs;
  final privacyPolicy = true.obs;
  final email = TextEditingController();
  final lastNAme = TextEditingController();
  final userName = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();
  Future<void> signup() async {
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

      // Check Privacy Policy
      if (privacyPolicy.value == false) {
        FullScreenLoader.warningSnackBar(
          title: "Privacy policy should be accepted",
          message: "",
        );
        // Hide loader before returning
        FullScreenLoader.hideLoadingDialog();
        return;
      }

      // Validate Form
      if (!signupFormKey.currentState!.validate()) {
        FullScreenLoader.hideLoadingDialog();
        return; // If form is invalid, exit function
      }

      // Register User
      final userCredentials = await AuthenticationRepository.instance
          .registerUserWithEmailAndPassword(
              email.text.trim(), password.text.trim());
      FullScreenLoader.hideLoadingDialog();
      // Create User Model
      final newUser = UserModel(
        id: userCredentials.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastNAme.text,
        username: userName.text,
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: "",
      );

      // Save User Record
      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      // Success Message
      FullScreenLoader.successSnackBar(
        title: "Congratulations",
        message: "Your account has been created! Verify email to continue",
      );

      // Navigate to Email Verification Screen
      Get.to(() => VerifyEmailScreen(email: email.text.trim()));
    } catch (e) {
      FullScreenLoader.warningSnackBar(title: "Oh snap", message: e.toString());
    } finally {
      // FullScreenLoader
      //     .hideLoadingDialog(); // Ensures loader is hidden in all cases
    }
  }
}
