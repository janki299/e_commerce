import 'package:flutter/material.dart';

class TCheckBoxTheme {
  TCheckBoxTheme._();

  // Light Theme Checkbox
  static final CheckboxThemeData lightCheckBoxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    checkColor: MaterialStateProperty.all(Colors.white),
    fillColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return Colors.blue; // Checked color in light mode
      }
      return Colors.grey; // Unchecked color
    }),
  );

  // Dark Theme Checkbox
  static final CheckboxThemeData darkCheckBoxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    checkColor: MaterialStateProperty.all(Colors.black),
    fillColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return Colors.green; // Checked color in dark mode
      }
      return Colors.white; // Unchecked color
    }),
  );
}
