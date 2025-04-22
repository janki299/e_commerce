import 'package:e_commerce/common_widgets/custom_button.dart';
import 'package:e_commerce/data/repositories/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/verify_email_controller.dart';
import '../../theme_widgets/textthem.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, this.email});
  final String? email;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
              onPressed: () => AuthenticationRepository.instance.logout(),
              icon: const Icon(Icons.clear))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                const Image(image: AssetImage("assets/images/searching.jpg")),
                const SizedBox(
                  height: 20,
                ),
                Text("Verify your email address",
                    style: isDarkMode
                        ? TTextThem.darkTextTheme.headlineMedium
                        : TTextThem.lightTextTheme.headlineMedium),
                const SizedBox(
                  height: 10,
                ),
                Text(email ?? "",
                    style: isDarkMode
                        ? TTextThem.darkTextTheme.titleMedium
                        : TTextThem.lightTextTheme.titleMedium),
                const SizedBox(
                  height: 20,
                ),
                Text(
                    " simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                    style: isDarkMode
                        ? TTextThem.darkTextTheme.bodySmall
                        : TTextThem.lightTextTheme.bodySmall),
                const SizedBox(
                  height: 30,
                ),
                CustomButton(
                  text: "Continue",
                  onPressed: () {
                    controller.checkEmailVerificationStatus();
                    // Get.to(() => SuccessScreen(
                    //       image: "assets/images/letter-t.png",
                    //       statusTitle: "Veryfy your email address",
                    //       onContinueTap: () {
                    //         Get.to(() => LoginScreen());
                    //       },
                    //       statusText:
                    //           "hjfdjkf jhjhfjdfhjdhfdhfjdhfjdhjdhfjhhd hjdhjdhdjsjddjfj jjahuhnjks jahjshu jhay",
                    //     ));
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextButton(
                    onPressed: () => controller.sendEmailVerification(),
                    child: Text("Resend Email",
                        style: isDarkMode
                            ? TTextThem.darkTextTheme.titleSmall!
                                .apply(color: Colors.blue)
                            : TTextThem.lightTextTheme.titleSmall!
                                .apply(color: Colors.blue))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
