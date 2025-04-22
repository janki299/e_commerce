import 'package:e_commerce/services/common_function.dart';
import 'package:flutter/material.dart';

import '../theme_widgets/textthem.dart';

class TSectionHeading extends StatelessWidget {
  const TSectionHeading(
      {super.key,
      required this.title,
      this.buttonText,
      this.onPress,
      this.showActionButton = false});
  final String title;
  final String? buttonText;
  final VoidCallback? onPress;
  final bool showActionButton;
  @override
  Widget build(BuildContext context) {
    final isDark = CommonFunction.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: isDark
                ? TTextThem.darkTextTheme.headlineSmall
                : TTextThem.lightTextTheme.headlineSmall,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          buttonText != null
              ? TextButton(onPressed: onPress, child: Text(buttonText!))
              : SizedBox()
        ],
      ),
    );
  }
}
