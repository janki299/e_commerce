import 'package:flutter/material.dart';

import '../services/common_function.dart';

class RoundedImage extends StatelessWidget {
  const RoundedImage({
    super.key,
    this.width,
    this.height,
    this.padding,
    this.icon,
    this.imageUrl,
  });
  final double? width;
  final double? height;
  final EdgeInsets? padding;
  final IconData? icon;
  final String? imageUrl;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color:
              CommonFunction.isDarkMode(context) ? Colors.black : Colors.white),
      child: imageUrl != ""
          ? Image(
              image: AssetImage("assets/images/telling.jpg"),
              color: CommonFunction.isDarkMode(context)
                  ? Colors.white
                  : Colors.black,
            )
          : Icon(
              icon,
              size: 48,
            ),
    );
  }
}
