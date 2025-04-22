import 'package:e_commerce/controller/forgotPassword_controller.dart';
import 'package:e_commerce/screens/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common_widgets/custom_button.dart';
import '../../services/common_function.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context) {
    var isDark = CommonFunction.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 12,
              ),
              Image(
                image: AssetImage("assets/images/telling.jpg"),
                // width: 32,
              ),
              const SizedBox(
                height: 45,
              ),
              CustomButton(
                color: Colors.blueAccent,
                text: "Submit",
                onPressed: () {
                  Get.offAll(() => LoginScreen());
                },
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                color: Colors.blueAccent,
                text: "resend",
                onPressed: () {
                  ForgotPasswordController.instance
                      .resendPasswordResetEmail(email);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
