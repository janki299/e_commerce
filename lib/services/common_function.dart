import 'package:flutter/material.dart';

class CommonFunction {
  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static Color? getColorFromString(String colorName) {
    colorName = colorName
        .toLowerCase(); // Convert to lowercase for case-insensitive matching

    if (colorName == "red") {
      return Colors.red;
    } else if (colorName == "green") {
      return Colors.green;
    } else if (colorName == "blue") {
      return Colors.blue;
    } else if (colorName == "yellow") {
      return Colors.yellow;
    } else if (colorName == "pink") {
      return Colors.pink;
    } else if (colorName == "black") {
      return Colors.black;
    } else if (colorName == "white") {
      return Colors.white;
    } else if (colorName == "purple") {
      return Colors.purple;
    } else if (colorName == "orange") {
      return Colors.orange;
    } else if (colorName == "gray" || colorName == "grey") {
      return Colors.grey;
    } else {
      return null; // Default color if no match is found
    }
  }
}
