import 'package:e_commerce/common_widgets/custom_rounded_icon.dart';
import 'package:e_commerce/services/common_function.dart';
import 'package:e_commerce/theme_widgets/textthem.dart';
import 'package:flutter/material.dart';

class TBottomWidgetProductDetail extends StatelessWidget {
  const TBottomWidgetProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = CommonFunction.isDarkMode(context);
    return Container(
      decoration: BoxDecoration(
          color: isDark ? Colors.grey : Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8), topRight: Radius.circular(8))),
      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              TCircularIcon(
                  backgroundColor: Colors.grey.shade100,
                  height: 40,
                  width: 40,
                  isDark: isDark,
                  onIconClick: () {},
                  color: Colors.black,
                  icon: Icons.remove),
              const SizedBox(
                width: 10,
              ),
              Text(
                "2",
                style: TTextThem.TTextThemeOnModeBase(context).titleSmall,
              ),
              const SizedBox(
                width: 10,
              ),
              TCircularIcon(
                  backgroundColor: Colors.black,
                  height: 40,
                  width: 40,
                  isDark: isDark,
                  onIconClick: () {},
                  color: Colors.white,
                  icon: Icons.add),
            ],
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(15),
                  backgroundColor: Colors.black,
                  side: BorderSide(color: Colors.black)),
              child: Text("Add to Cart"),
              onPressed: () {}),
        ],
      ),
    );
  }
}
