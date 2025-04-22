// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
//
// import '../services/keys.dart';
//
// class AuthServices {
//   Future<void> signInWithUserCredential(
//       {required String email, required String password}) async {
//     try {
//       final userCredential = await FirebaseAuth.instance
//           .signInWithEmailAndPassword(email: email, password: password);
//       await ScaffoldMessenger.of(Keys.navigatorKey.currentContext!)
//           .showSnackBar(
//         const SnackBar(
//             content: Text(
//           "Form Submitted Successfully!",
//           style: TextStyle(color: Colors.greenAccent),
//         )),
//       );
//       // Navigator.pushAndRemoveUntil(Keys.navigatorKey.currentContext!,
//       //     MaterialPageRoute(
//       //   builder: (context) {
//       //     return AdminHome();
//       //   },
//       // ), (Route<dynamic> route) => false);
//       print("on sucess  $userCredential");
//     } on FirebaseAuthException catch (e) {
//       await ScaffoldMessenger.of(Keys.navigatorKey.currentContext!)
//           .showSnackBar(
//         SnackBar(
//             content: Text(
//           e.message!,
//           style: TextStyle(color: Colors.red),
//         )),
//       );
//     }
//   }
//
//   Future<void> createUserWihEmailAndPassword(
//       {required String email, required String password}) async {
//     try {
//       final userCredential = await FirebaseAuth.instance
//           .createUserWithEmailAndPassword(email: email, password: password);
//       await ScaffoldMessenger.of(Keys.navigatorKey.currentContext!)
//           .showSnackBar(
//         const SnackBar(content: Text("Form Submitted Successfully!")),
//       );
//       print("on sucess  $userCredential");
//     } on FirebaseAuthException catch (e) {
//       await ScaffoldMessenger.of(Keys.navigatorKey.currentContext!)
//           .showSnackBar(
//         SnackBar(
//             content: Text(
//           e.message!,
//           style: TextStyle(color: Colors.red),
//         )),
//       );
//     }
//   }
// }
