import 'package:e_commerce/controller/login_controller.dart';
import 'package:e_commerce/screens/signup_screen/signup_screen.dart';
import 'package:e_commerce/screens/signup_screen/social_buttons.dart';
import 'package:e_commerce/services/looger.dart';
import 'package:e_commerce/theme_widgets/textthem.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

import '../../common_widgets/custom_button.dart';
import 'login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loginController = Get.put(LoginController());
    var isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 10, left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 70,
                    ),
                    const Image(
                      image: AssetImage("assets/images/letter-t.png"),
                      height: 160,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Wellcome Back",
                      style: isDark
                          ? TTextThem.darkTextTheme.headlineMedium
                          : TTextThem.lightTextTheme.headlineMedium,
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      "To Experience Application login bhgdhjsgd hduwhu \n weu ghfgjghj ydy dfhb hhdji nnjhhdjo",
                      style: isDark
                          ? TTextThem.darkTextTheme.bodySmall
                          : TTextThem.lightTextTheme.bodySmall,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              LoginForm(),
              const SizedBox(
                height: 10,
              ),
              CustomButton(
                  color: Colors.blueAccent,
                  text: "Sign In",
                  onPressed: () => loginController.emailAndPasswordSignIn()),
              const SizedBox(
                height: 10,
              ),
              CustomButton(
                isOutlined: true,
                color: Colors.transparent,
                text: "Create Account",
                onPressed: () {
                  Logger.log("on tap create account", validateField(""));
                  Get.to(() => SignupScreen());
                },
              ),
              TSocialButtons()
            ],
          ),
        ),
      ),
    );
  }
}
