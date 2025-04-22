import 'package:e_commerce/screens/signup_screen/signup_form.dart';
import 'package:e_commerce/screens/signup_screen/social_buttons.dart';
import 'package:e_commerce/theme_widgets/textthem.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              Text(
                "Lets'Create Account",
                style: isDarkMode
                    ? TTextThem.darkTextTheme.headlineMedium
                    : TTextThem.lightTextTheme.headlineMedium,
              ),
              const SizedBox(
                height: 20,
              ),
              TSignupForm(isDarkMode: isDarkMode),
              TSocialButtons()
            ],
          ),
        ),
      ),
    );
  }
}
