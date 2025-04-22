import 'package:e_commerce/services/layout.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final Color textColor;
  final double borderRadius;
  final bool isDisabled;
  final bool isOutlined;

  const CustomButton(
      {Key? key,
      required this.text,
      required this.onPressed,
      this.color = Colors.blueAccent,
      this.textColor = Colors.white,
      this.borderRadius = 12.0,
      this.isOutlined = false,
      this.isDisabled = false,
      th})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDark = Theme.of(context).brightness == Brightness.dark;
    return GestureDetector(
      onTap: () {
        onPressed.call();
      },
      child: Container(
        height: 50,
        width: Layout.width(context),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: isOutlined
              ? Colors.transparent
              : (isDisabled ? Colors.grey : color),
          border: Border.all(
            color: isOutlined
                ? isDark
                    ? Colors.white
                    : Colors.black
                : color, // Outline color if enabled
            width: 1,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(child: Text(text)),
        ),
      ),
    );
  }
}
