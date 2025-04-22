import 'package:e_commerce/services/looger.dart';
import 'package:flutter/material.dart';

import '../../common_widgets/custom_button.dart';
import '../../theme_widgets/textthem.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen(
      {super.key,
      required this.statusText,
      required this.statusTitle,
      required this.image,
      required this.onContinueTap});
  final String statusText;
  final String statusTitle;
  final String image;
  final VoidCallback onContinueTap;
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
        child: SafeArea(
          child: Column(
            children: [
              Image(image: AssetImage(image)),
              const SizedBox(
                height: 20,
              ),
              Text(statusTitle,
                  style: isDarkMode
                      ? TTextThem.darkTextTheme.headlineMedium
                      : TTextThem.lightTextTheme.headlineMedium),
              const SizedBox(
                height: 10,
              ),
              Text(statusText,
                  style: isDarkMode
                      ? TTextThem.darkTextTheme.bodySmall
                      : TTextThem.lightTextTheme.bodySmall),
              const SizedBox(
                height: 30,
              ),
              CustomButton(
                text: "Continue",
                onPressed: () {
                  Logger.log("oncontinue press", "");
                  onContinueTap.call();
                },
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
