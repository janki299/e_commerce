import 'package:flutter/material.dart';

import '../services/common_function.dart';
import '../services/layout.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
    this.icon = Icons.search,
    required this.text,
    this.showBackGroundColor = true,
    this.showBorder = true,
  });
  final IconData? icon;
  final String text;
  final bool showBackGroundColor, showBorder;
  @override
  Widget build(BuildContext context) {
    final bool isDark = CommonFunction.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
      child: Container(
        width: Layout.width(context),
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
            color: showBackGroundColor ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(4),
            border: showBorder ? Border.all(color: Colors.grey) : null),
        child: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(icon),
              color: Colors.grey,
            ),
            SizedBox(
              width: 6,
            ),
            Text(text)
          ],
        ),
      ),
    );
  }
}
