import 'package:e_commerce/data/user/user_repository.dart';
import 'package:e_commerce/navigation_menu.dart';
import 'package:e_commerce/screens/into_screen/intro_sceen.dart';
import 'package:e_commerce/screens/login_screen/login_screen.dart';
import 'package:e_commerce/screens/signup_screen/verify_email_screen.dart';
import 'package:e_commerce/services/looger.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;
  User? get authUser => _auth.currentUser;
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  Future<UserCredential> registerUserWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      return Logger.log(
          "FirebaseAuthException registerUserWithEmailAndPassword",
          e.toString());
    } on FirebaseException catch (e) {
      return Logger.log(
          "FirebaseException registerUserWithEmailAndPassword", e.toString());
    } on FormatException catch (e) {
      return Logger.log(
          "FormatException registerUserWithEmailAndPassword", e.toString());
    } on PlatformException catch (e) {
      return Logger.log(
          "PlatformException registerUserWithEmailAndPassword", e.toString());
    } catch (e) {
      return Logger.log(
          "on error on userregister registerUserWithEmailAndPassword",
          e.toString());
    }
  }

  Future<UserCredential> loginUserWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      return Logger.log(
          "FirebaseAuthException registerUserWithEmailAndPassword",
          e.toString());
    } on FirebaseException catch (e) {
      return Logger.log(
          "FirebaseException registerUserWithEmailAndPassword", e.toString());
    } on FormatException catch (e) {
      return Logger.log(
          "FormatException registerUserWithEmailAndPassword", e.toString());
    } on PlatformException catch (e) {
      return Logger.log(
          "PlatformException registerUserWithEmailAndPassword", e.toString());
    } catch (e) {
      return Logger.log(
          "on error on userregister registerUserWithEmailAndPassword",
          e.toString());
    }
  }

  Future<UserCredential?> signinWithGoogle() async {
    try {
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await userAccount?.authentication;

      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
      return await _auth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      return Logger.log(
          "FirebaseAuthException sendEmailVerification", e.toString());
    } on FirebaseException catch (e) {
      return Logger.log(
          "FirebaseException sendEmailVerification", e.toString());
    } on FormatException catch (e) {
      return Logger.log("FormatException sendEmailVerification", e.toString());
    } on PlatformException catch (e) {
      return Logger.log(
          "PlatformException sendEmailVerification", e.toString());
    } catch (e) {
      return Logger.log(
          "on error on userregister sendEmailVerification", e.toString());
    }
  }

  Future<void> reAuthenticateEmailAndPassword(
      String email, String password) async {
    try {
      AuthCredential credential =
          EmailAuthProvider.credential(email: email, password: password);
      await _auth.currentUser?.reauthenticateWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      return Logger.log(
          "FirebaseAuthException sendEmailVerification", e.toString());
    } on FirebaseException catch (e) {
      return Logger.log(
          "FirebaseException sendEmailVerification", e.toString());
    } on FormatException catch (e) {
      return Logger.log("FormatException sendEmailVerification", e.toString());
    } on PlatformException catch (e) {
      return Logger.log(
          "PlatformException sendEmailVerification", e.toString());
    } catch (e) {
      return Logger.log(
          "on error on userregister sendEmailVerification", e.toString());
    }
  }

  Future<void> deleteAccount() async {
    try {
      await UserRepository.instance.removeUserRecord(_auth.currentUser!.uid);
      await _auth.currentUser?.delete();
    } on FirebaseAuthException catch (e) {
      return Logger.log(
          "FirebaseAuthException sendEmailVerification", e.toString());
    } on FirebaseException catch (e) {
      return Logger.log(
          "FirebaseException sendEmailVerification", e.toString());
    } on FormatException catch (e) {
      return Logger.log("FormatException sendEmailVerification", e.toString());
    } on PlatformException catch (e) {
      return Logger.log(
          "PlatformException sendEmailVerification", e.toString());
    } catch (e) {
      return Logger.log(
          "on error on userregister sendEmailVerification", e.toString());
    }
  }

  screenRedirect() async {
    final user = _auth.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        Get.offAll(() => NavigationMenu());
      } else {
        Get.offAll(() => VerifyEmailScreen(
              email: _auth.currentUser?.email,
            ));
      }
    } else {
      deviceStorage.writeIfNull("IsFirstTime", true);
      deviceStorage.read("IsFirstTime") != true
          ? Get.offAll(() => const LoginScreen())
          : Get.offAll(() => const IntroSceen());
    }
  }

  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      return Logger.log(
          "FirebaseAuthException sendEmailVerification", e.toString());
    } on FirebaseException catch (e) {
      return Logger.log(
          "FirebaseException sendEmailVerification", e.toString());
    } on FormatException catch (e) {
      return Logger.log("FormatException sendEmailVerification", e.toString());
    } on PlatformException catch (e) {
      return Logger.log(
          "PlatformException sendEmailVerification", e.toString());
    } catch (e) {
      return Logger.log(
          "on error on userregister sendEmailVerification", e.toString());
    }
  }

  Future<void> logout() async {
    try {
      await GoogleSignIn().signOut();
      await FirebaseAuth.instance.signOut();
      Get.off(() => LoginScreen());
    } on FirebaseAuthException catch (e) {
      return Logger.log(
          "FirebaseAuthException sendEmailVerification", e.toString());
    } on FirebaseException catch (e) {
      return Logger.log(
          "FirebaseException sendEmailVerification", e.toString());
    } on FormatException catch (e) {
      return Logger.log("FormatException sendEmailVerification", e.toString());
    } on PlatformException catch (e) {
      return Logger.log(
          "PlatformException sendEmailVerification", e.toString());
    } catch (e) {
      return Logger.log(
          "on error on userregister sendEmailVerification", e.toString());
    }
  }

  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      return Logger.log(
          "FirebaseAuthException sendEmailVerification", e.toString());
    } on FirebaseException catch (e) {
      return Logger.log(
          "FirebaseException sendEmailVerification", e.toString());
    } on FormatException catch (e) {
      return Logger.log("FormatException sendEmailVerification", e.toString());
    } on PlatformException catch (e) {
      return Logger.log(
          "PlatformException sendEmailVerification", e.toString());
    } catch (e) {
      return Logger.log(
          "on error on userregister sendEmailVerification", e.toString());
    }
  }
}
