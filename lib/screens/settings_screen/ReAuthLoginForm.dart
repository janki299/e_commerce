import 'package:e_commerce/controller/user_controller.dart';
import 'package:flutter/material.dart';

import '../../common_widgets/appbar.dart';
import '../../common_widgets/custom_texfield.dart';
import '../../theme_widgets/textthem.dart';
import '../../validator/validation.dart';

class ReAuthLoginForm extends StatelessWidget {
  const ReAuthLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: TAppBar(
          showBackArrow: true,
          title: Text(
            "Re-Authenticate User",
            style: TTextThem.TTextThemeOnModeBase(context).titleLarge,
          )),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Form(
                key: controller.reAuthKey,
                child: Column(
                  children: [
                    CustomTextField(
                      controller: controller.email,
                      validation: TValidator.validateName,
                      hintText: "Email",
                      prefixIcon: Icons.email,
                    ),
                    const SizedBox(
                      height: 10,
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
                  ],
                )),
            const SizedBox(
              height: 22,
            ),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () =>
                        controller.reAuthenticateMailAndPasswordUser(),
                    child: Text("Veriify")))
          ],
        ),
      ),
    );
  }
}
