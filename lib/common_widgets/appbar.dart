import 'package:e_commerce/services/common_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TAppBar(
      {super.key,
      this.title,
      this.showBackArrow,
      this.leadingIcon,
      this.action,
      this.leadingOnPress});

  final Widget? title;
  final bool? showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? action;
  final VoidCallback? leadingOnPress;

  @override
  Widget build(BuildContext context) {
    final isDark = CommonFunction.isDarkMode(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2, vertical: 12),
      child: AppBar(
        automaticallyImplyLeading: false,
        leading: showBackArrow != null
            ? IconButton(
                onPressed: () => Get.back(),
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: isDark ? Colors.white : Colors.black,
                ))
            : leadingIcon != null
                ? IconButton(onPressed: leadingOnPress, icon: Icon(leadingIcon))
                : null,
        title: title,
        actions: action,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(60);
}
