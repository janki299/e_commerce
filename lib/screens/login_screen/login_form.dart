import 'package:e_commerce/controller/login_controller.dart';
import 'package:e_commerce/services/looger.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common_widgets/custom_texfield.dart';
import '../../validator/validation.dart';
import '../forgotPassword_screen/forgot_password_screen.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final loginController = Get.put(LoginController());
    return Form(
        key: loginController.loginKey,
        child: Column(
          children: [
            CustomTextField(
              validation: (p0) => TValidator.validateEmail(p0),
              hintText: "Email",
              prefixIcon: Icons.email,
              controller: loginController.email,
              // errorText: passwordError,
              // onChanged: validatePassword,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
              validation: (p0) => TValidator.validatePassword(p0),
              hintText: "Password",
              prefixIcon: Icons.lock_outline,
              isPassword: true,
              controller: loginController.password,
              // errorText: passwordError,
              // onChanged: validatePassword,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Obx(
                      () => Checkbox(
                        activeColor: Colors.blueAccent,
                        checkColor: Colors.black,
                        value: loginController.checkBoxChecked.value,
                        onChanged: (value) {
                          Logger.log("value of remeber me", value);
                          loginController.checkBoxChecked.value =
                              !loginController.checkBoxChecked.value;
                        },
                      ),
                    ),
                    const Text("Remember me"),
                  ],
                ),
                TextButton(
                    onPressed: () {
                      Get.to(() => ForgotPasswordScreen());
                    },
                    child: Text(
                      "Forgot Password?",
                      // style: isDark
                      //     ? TTextThem.darkTextTheme.bodySmall
                      //     : TTextThem.lightTextTheme.bodySmall,
                    ))
              ],
            )
          ],
        ));
  }
}
