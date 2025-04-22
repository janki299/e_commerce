import 'package:flutter/material.dart';

import '../../theme_widgets/textthem.dart';

class TProfileDetailWidget extends StatelessWidget {
  const TProfileDetailWidget({
    super.key,
    this.icon = Icons.arrow_forward_ios_rounded,
    required this.onPressed,
    required this.title,
    required this.value,
  });
  final IconData icon;
  final VoidCallback onPressed;
  final String title, value;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TTextThem.TTextThemeOnModeBase(context).bodySmall,
            ),
            Text(
              value,
              style: TTextThem.TTextThemeOnModeBase(context).bodyMedium,
            ),
            Icon(Icons.arrow_forward_ios_rounded)
          ],
        ),
      ),
    );
  }
}
