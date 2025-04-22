import 'package:e_commerce/controller/forgotPassword_controller.dart';
import 'package:e_commerce/services/common_function.dart';
import 'package:e_commerce/theme_widgets/textthem.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common_widgets/custom_button.dart';
import '../../common_widgets/custom_texfield.dart';
import '../../services/looger.dart';
import '../../validator/validation.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var isDark = CommonFunction.isDarkMode(context);
    final controller = Get.put(ForgotPasswordController());
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Forgot Password",
                style: isDark
                    ? TTextThem.darkTextTheme.headlineMedium
                    : TTextThem.lightTextTheme.headlineMedium,
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                "Forgot Password",
                style: isDark
                    ? TTextThem.darkTextTheme.bodySmall
                    : TTextThem.lightTextTheme.bodySmall,
              ),
              const SizedBox(
                height: 45,
              ),
              Form(
                key: controller.forgotPasswordKey,
                child: CustomTextField(
                  hintText: "Email",
                  prefixIcon: Icons.send,
                  controller: controller.email,
                  validation: (p0) => TValidator.validateEmail(p0),
                  // errorText: passwordError,
                  // onChanged: validatePassword,
                ),
              ),
              const SizedBox(
                height: 45,
              ),
              CustomButton(
                color: Colors.blueAccent,
                text: "Submit",
                onPressed: () {
                  controller.sendPasswordResetEmail();
                  Logger.log("submit on forgot password", isDark);
                  // Get.offAll(() => const ResetPasswordScreen());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
