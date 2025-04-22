import 'package:e_commerce/data/repositories/authentication_repository.dart';
import 'package:e_commerce/data/user/user_model.dart';
import 'package:e_commerce/data/user/user_repository.dart';
import 'package:e_commerce/screens/lodder.dart';
import 'package:e_commerce/screens/login_screen/login_screen.dart';
import 'package:e_commerce/services/looger.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../screens/settings_screen/ReAuthLoginForm.dart';
import '../services/network_manager.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();
  Rx<UserModel> user = UserModel.empty().obs;
  final userRepository = Get.put(UserRepository());
  final profileLoading = false.obs;
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> reAuthKey = GlobalKey<FormState>();
  final imageUploading = false.obs;
  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
      profileLoading.value = false;
    } catch (e) {
      Logger.log("value catch on error fetch user data", e.toString());
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  void deleteAccountWarningPopup() {
    Get.defaultDialog(
        contentPadding: EdgeInsets.all(12),
        title: "Delete Account",
        middleText:
            "Are yoy sure to delete account permanently? This is not reversible and all of your data will be removed permanently",
        confirm: ElevatedButton(
            onPressed: () => deleteUserAccount(),
            child: Padding(
              padding: EdgeInsets.all(
                12,
              ),
              child: Text("Delete"),
            )),
        cancel: OutlinedButton(
          onPressed: () => Navigator.of(Get.overlayContext!).pop(),
          child: Text("Cancel"),
        ));
  }

  Future<void> reAuthenticateMailAndPasswordUser() async {
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
      if (!reAuthKey.currentState!.validate()) {
        FullScreenLoader.hideLoadingDialog();
        return;
      }
      await AuthenticationRepository.instance.reAuthenticateEmailAndPassword(
          email.text.trim(), password.text.trim());
      await AuthenticationRepository.instance.deleteAccount();
      FullScreenLoader.hideLoadingDialog();
      Get.off(() => LoginScreen());
    } catch (e) {
      FullScreenLoader.hideLoadingDialog();
      Logger.log("reAuhenticateemailAndPasswordUser", e.toString());
    }
  }

  Future<void> deleteUserAccount() async {
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
      final auth = AuthenticationRepository.instance;
      final provider = auth.authUser!.providerData
          .map(
            (e) => e.providerId,
          )
          .first;
      if (provider.isNotEmpty) {
        if (provider == "google.com") {
          await auth.signinWithGoogle();
          await auth.deleteAccount();
          FullScreenLoader.hideLoadingDialog();
          Get.offAll(() => LoginScreen());
        } else if (provider == "password") {
          FullScreenLoader.hideLoadingDialog();
          Get.to(() => ReAuthLoginForm());
        }
      }
    } catch (e) {
      Logger.log("on delete accout catch error", e.toString());
    }
  }

  uploadUserProfilePicture(String previousImage) async {
    try {
      Logger.log("image ", previousImage);

      final image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 20,
        maxHeight: 511,
        maxWidth: 512,
      );

      if (image != null) {
        imageUploading.value = true;
        Logger.log("value on image upload", image.path);

        // Upload new image
        final newImageUrl = await userRepository.uploadImage("profile", image);
        Logger.log("newImageUrl", newImageUrl);

        // Delete old image if it exists and is different
        if (previousImage.isNotEmpty && previousImage != newImageUrl) {
          await userRepository.deleteOldImage(previousImage);
          Logger.log("delete image ", previousImage);
        }

        // Update image URL in Firebase Realtime/Firestore
        Map<String, dynamic> json = {"ProfilePicture": newImageUrl};
        await userRepository.updateSingleValue(json);
        user.value.profilePicture = newImageUrl;
        user.refresh();
        Logger.log("Updated Firebase & local user", user.value.profilePicture);
      }
    } catch (e) {
      Logger.log("on image upload catch error", e.toString());
    } finally {
      imageUploading.value = false;
    }
  }

  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      await fetchUserRecord();
      if (user.value.id.isEmpty) {
        if (userCredentials != null) {
          final nameParts =
              UserModel.nameParts(userCredentials.user!.displayName ?? "");
          final userName = UserModel.generateUsername(
              userCredentials.user!.displayName ?? "");
          final user = UserModel(
            id: userCredentials.user!.uid,
            firstName: nameParts[0],
            lastName:
                nameParts.length > 1 ? nameParts.sublist(1).join(" ") : "",
            username: userName,
            email: userCredentials.user?.email ?? "",
            phoneNumber: userCredentials.user?.phoneNumber ?? "",
            profilePicture: userCredentials.user?.photoURL ?? "",
          );
          await userRepository.saveUserRecord(user);
        }
      }
    } catch (e) {
      FullScreenLoader.warningSnackBar(
          title: "Data not saved",
          message:
              "Something went wrong saving your information. you can re-save your data in yourProfile .");
    }
  }
}
