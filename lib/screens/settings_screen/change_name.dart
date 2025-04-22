import 'package:e_commerce/common_widgets/appbar.dart';
import 'package:e_commerce/common_widgets/custom_texfield.dart';
import 'package:e_commerce/controller/update_name_controller.dart';
import 'package:e_commerce/theme_widgets/textthem.dart';
import 'package:e_commerce/validator/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());
    return Scaffold(
      appBar: TAppBar(
          showBackArrow: true,
          title: Text(
            "Change Name",
            style: TTextThem.TTextThemeOnModeBase(context).titleLarge,
          )),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            Text(
              "use real name for easy varification .This name will appear on several pages .",
              style: TTextThem.TTextThemeOnModeBase(context).bodySmall,
            ),
            const SizedBox(
              height: 10,
            ),
            Form(
                key: controller.updateUserNameFormKey,
                child: Column(
                  children: [
                    CustomTextField(
                      controller: controller.firstName,
                      validation: TValidator.validateName,
                      hintText: "First Name",
                      prefixIcon: Icons.person,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      controller: controller.lastName,
                      validation: TValidator.validateName,
                      hintText: "Last Name",
                      prefixIcon: Icons.person,
                    )
                  ],
                )),
            const SizedBox(
              height: 22,
            ),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => controller.updateUserName(),
                    child: Text("Save")))
          ],
        ),
      ),
    );
  }
}
