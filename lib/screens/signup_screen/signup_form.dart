import 'package:e_commerce/controller/signup_controller.dart';
import 'package:e_commerce/services/looger.dart';
import 'package:e_commerce/validator/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common_widgets/custom_button.dart';
import '../../common_widgets/custom_texfield.dart';
import '../../services/layout.dart';
import '../../theme_widgets/textthem.dart';

class TSignupForm extends StatelessWidget {
  const TSignupForm({
    super.key,
    required this.isDarkMode,
  });

  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Form(
        key: controller.signupFormKey,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTextField(
                  validation: (p0) => TValidator.validateName(p0),
                  controller: controller.firstName,
                  width: Layout.width(context) * 0.44,
                  hintText: "First name",
                  prefixIcon: Icons.person,
                ),
                CustomTextField(
                  validation: (p0) => TValidator.validateName(p0),
                  controller: controller.lastNAme,
                  width: Layout.width(context) * 0.44,
                  hintText: "Last name",
                  prefixIcon: Icons.person,
                )
              ],
            ),
            const SizedBox(
              height: 14,
            ),
            CustomTextField(
              validation: (p0) => TValidator.validateName(p0),
              controller: controller.userName,
              hintText: "UserName",
              prefixIcon: Icons.person_search,
            ),
            const SizedBox(
              height: 14,
            ),
            CustomTextField(
              validation: (p0) => TValidator.validateEmail(p0),
              controller: controller.email,
              hintText: "E-mail",
              prefixIcon: Icons.person_search,
            ),
            const SizedBox(
              height: 14,
            ),
            CustomTextField(
              validation: (p0) => TValidator.validatePhone(p0),
              controller: controller.phoneNumber,
              hintText: "Phone Number",
              prefixIcon: Icons.person_search,
            ),
            const SizedBox(
              height: 14,
            ),
            CustomTextField(
              validation: (p0) => TValidator.validatePassword(p0),
              hintText: "Password",
              prefixIcon: Icons.lock_outline,
              isPassword: true,
              controller: controller.password,
              // errorText: passwordError,
              // onChanged: validatePassword,
            ),
            const SizedBox(
              height: 14,
            ),
            Row(
              children: [
                Obx(
                  () => Checkbox(
                    activeColor: Colors.blueAccent,
                    checkColor: Colors.black,
                    focusColor: Colors.black,
                    value: controller.privacyPolicy.value,
                    onChanged: (value) {
                      controller.privacyPolicy.value =
                          !controller.privacyPolicy.value;
                      Logger.log("value on check box ", value);
                    },
                  ),
                ),
                Expanded(
                  child: Text.rich(TextSpan(children: [
                    TextSpan(
                        text: "I agree to ",
                        style: isDarkMode
                            ? TTextThem.darkTextTheme.bodyMedium
                            : TTextThem.lightTextTheme.bodyMedium),
                    TextSpan(
                        text: "Privacy Policy",
                        style: isDarkMode
                            ? TTextThem.darkTextTheme.titleSmall!
                                .apply(decoration: TextDecoration.underline)
                            : TTextThem.lightTextTheme.titleSmall!
                                .apply(decoration: TextDecoration.underline)),
                    TextSpan(
                        text: " and ",
                        style: isDarkMode
                            ? TTextThem.darkTextTheme.bodyMedium
                            : TTextThem.lightTextTheme.bodyMedium),
                    TextSpan(
                        text: "Tearms of Use",
                        style: isDarkMode
                            ? TTextThem.darkTextTheme.titleSmall!
                                .apply(decoration: TextDecoration.underline)
                            : TTextThem.lightTextTheme.titleSmall!
                                .apply(decoration: TextDecoration.underline))
                  ])),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            CustomButton(
                text: "Create Account",
                onPressed: () {
                  controller.signup();
                  // Get.to(() => VerifyEmailScreen());
                })
          ],
        ));
  }
}
