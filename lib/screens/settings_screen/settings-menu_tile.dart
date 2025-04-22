import 'package:e_commerce/theme_widgets/textthem.dart';
import 'package:flutter/material.dart';

class TSettingsMenuTile extends StatelessWidget {
  const TSettingsMenuTile(
      {super.key,
      required this.icon,
      required this.title,
      required this.subTitle,
      this.trailing,
      required this.color,
      required this.size,
      required this.onTap});
  final IconData icon;
  final String title, subTitle;
  final Widget? trailing;
  final Color color;
  final double size;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: color,
        size: size,
      ),
      title: Text(
        title,
        style: TTextThem.TTextThemeOnModeBase(context).titleMedium,
      ),
      subtitle: Text(
        subTitle,
        style: TTextThem.TTextThemeOnModeBase(context).titleMedium,
      ),
      trailing: trailing,
      onTap: onTap,
    );
  }
}
