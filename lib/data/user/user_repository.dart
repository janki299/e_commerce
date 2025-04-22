import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/data/repositories/authentication_repository.dart';
import 'package:e_commerce/data/user/user_model.dart';
import 'package:e_commerce/services/looger.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserRepository extends GetxController {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  static UserRepository get instance => Get.find();
  final supabase = Supabase.instance.client;
  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection("Users").doc(user.id).set(user.toJson());
      Logger.log("_db", user.id);
    } on FirebaseException catch (e) {
      throw "Something went Wrong .Please try again";
    } on FormatException catch (e) {
      throw "Something went Wrong .Please try again";
    } on PlatformException catch (e) {
      throw "Something went Wrong .Please try again";
    } catch (e) {
      throw "Something went Wrong .Please try again";
    }
  }

  Future<UserModel> fetchUserDetails() async {
    try {
      final documentSnapShot = await _db
          .collection("Users")
          .doc(AuthenticationRepository.instance.authUser?.uid)
          .get();
      if (documentSnapShot.exists) {
        return UserModel.fromSnapshot(documentSnapShot);
      } else {
        return UserModel.empty();
      }
      // await _db.collection("Users").doc(user.id).set(user.toJson());
      // Logger.log("_db", user.id);
    } on FirebaseException catch (e) {
      throw e.toString();
    } on FormatException catch (e) {
      throw e.toString();
    } on PlatformException catch (e) {
      throw e.toString();
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> updateUserDetail(UserModel updateUser) async {
    try {
      await _db
          .collection("Users")
          .doc(updateUser.id)
          .update(updateUser.toJson());
      // await _db.collection("Users").doc(user.id).set(user.toJson());
      // Logger.log("_db", user.id);
    } on FirebaseException catch (e) {
      throw "Something went Wrong .Please try again";
    } on FormatException catch (e) {
      throw "Something went Wrong .Please try again";
    } on PlatformException catch (e) {
      throw "Something went Wrong .Please try again";
    } catch (e) {
      throw "updateUserDetail .Please try again";
    }
  }

  Future<void> removeUserRecord(String userId) async {
    try {
      await _db.collection("Users").doc(userId).delete();
      Logger.log("_db", userId);
    } on FirebaseException catch (e) {
      throw "Something went Wrong .Please try again";
    } on FormatException catch (e) {
      throw "Something went Wrong .Please try again";
    } on PlatformException catch (e) {
      throw "Something went Wrong .Please try again";
    } catch (e) {
      throw "Something went Wrong .Please try again";
    }
  }

  Future<void> updateSingleValue(Map<String, dynamic> json) async {
    try {
      await _db
          .collection("Users")
          .doc(AuthenticationRepository.instance.authUser?.uid)
          .update(json);
      Logger.log("json values", json);
      // await _db.collection("Users").doc(user.id).set(user.toJson());
      // Logger.log("_db", user.id);
    } on FirebaseException catch (e) {
      throw "Something went Wrong .Please try again";
    } on FormatException catch (e) {
      throw "Something went Wrong .Please try again";
    } on PlatformException catch (e) {
      throw "Something went Wrong .Please try again";
    } catch (e) {
      throw "updateUserDetail .Please try again";
    }
  }

  Future<String> uploadImage(String path, XFile image) async {
    try {
      final supabase = Supabase.instance.client;
      final file = File(image.path);
      final fileName = image.name; // Keep the original image name

      // Upload image to the "profile" bucket in Supabase Storage
      await supabase.storage.from('profile').upload('$path/$fileName', file);

      // Get the public URL of the uploaded image
      final url =
          supabase.storage.from('profile').getPublicUrl('$path/$fileName');
      Logger.log("uploadImage", url);
      return supabase.storage.from('profile').getPublicUrl('$path/$fileName');

      ///tis is firebase code to add in firebase storage
      // final ref = FirebaseStorage.instance.ref(path).child(image.name);
      // await ref.putFile(File(image.path));
      // final url = await ref.getDownloadURL();
      // return url;
    } on FirebaseException catch (e) {
      throw "Something went Wrong .Please try again";
    } on FormatException catch (e) {
      throw "Something went Wrong .Please try again";
    } on PlatformException catch (e) {
      throw "Something went Wrong .Please try again";
    } catch (e) {
      throw "${e.toString()}";
    }
  }

  String getSupabasePathFromUrl(String url) {
    final uri = Uri.parse(url);
    final index = uri.pathSegments.indexOf('profile');
    if (index != -1) {
      return uri.pathSegments.sublist(index + 1).join('/');
    }
    return '';
  }

  Future<void> deleteOldImage(String imageUrl) async {
    try {
      Logger.log("Original image URL", imageUrl);

      // Convert full public URL to relative path
      final path = getSupabasePathFromUrl(imageUrl);

      Logger.log("Deleting path from Supabase", path);

      await supabase.storage.from('profile').remove([path]);
    } catch (e) {
      Logger.log("Error deleting image", e.toString());
      throw e.toString();
    }
  }
}
