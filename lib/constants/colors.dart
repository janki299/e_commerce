import 'package:flutter/cupertino.dart';

class TColors {
  TColors._();
  static const Color primaryColor = Color(0xFF4B6BFF);
  static const Color secondary = Color(0xFFFFE24B);
  static const Color accent = Color(0xFFb0c7ff);

  static const Color textPrimary = Color(0xFF030304);
  static const Color dark = Color(0xFF9E9D9B);
  static const Color textWhite = Color(0xffaeaec5);

  static const Color lightContainer = Color(0xFFFFFFFF);
  static const Gradient linearGradient = LinearGradient(
      begin: Alignment(0.0, 0.0),
      end: Alignment(0.707, -0.707),
      colors: [
        Color(0xffff9a9e),
        Color(0xfffad0c4),
        Color(0xfffad0c4),
      ]);
}
