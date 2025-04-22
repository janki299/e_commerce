import 'package:flutter/material.dart';

class TCircularIcon extends StatelessWidget {
  const TCircularIcon({
    super.key,
    required this.isDark,
    required this.onIconClick,
    required this.icon,
    this.color,
    this.backgroundColor,
    this.size,
    this.image,
    this.height,
    this.width,
  });

  final bool isDark;
  final VoidCallback onIconClick;
  final IconData icon;
  final Color? color;
  final Color? backgroundColor;
  final double? size;
  final String? image;
  final double? height, width;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: backgroundColor != null
              ? backgroundColor!
              : isDark
                  ? Colors.black45.withOpacity(0.9)
                  : Colors.white24.withOpacity(0.9)),
      child: IconButton(
          onPressed: onIconClick,
          icon: Icon(
            icon,
            color: color,
            size: size,
          )),
    );
  }
}
