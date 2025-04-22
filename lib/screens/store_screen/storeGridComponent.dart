import 'package:e_commerce/screens/store_screen/store_screen.dart';
import 'package:flutter/material.dart';

import '../../common_widgets/custom_rounded_image.dart';
import '../../services/common_function.dart';
import '../../theme_widgets/textthem.dart';
import '../home_screen/Tcircular_container.dart';

class Storegridcomponent extends StatelessWidget {
  const Storegridcomponent({
    Key? key,
    this.height,
    this.showBorder = true,
    this.onTap, // This is fixed now
  }) : super(key: key);

  final double? height;
  final bool showBorder;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final isDark = CommonFunction.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: TcircularContainer(
        padding: EdgeInsets.all(8),
        radius: 8,
        height: height,
        backgroundColor: Colors.transparent,
        borderColor: showBorder ? Colors.grey : Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: Row(
            children: [
              Flexible(
                child: RoundedImage(
                  padding: EdgeInsets.all(5),
                  height: 56,
                  width: 56,
                  imageUrl: "",
                  icon: Icons.girl_sharp,
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextwithIcon(text: "hsgdh"),
                    Text(
                      maxLines: 2,
                      "245 products heuwyh yrueyf8ewyr r e8ry89ery78e9r yd8ey",
                      overflow: TextOverflow.ellipsis,
                      style: TTextThem.TTextThemeOnModeBase(context)
                          .labelSmall!
                          .apply(
                            color: isDark ? Colors.grey.shade200 : Colors.black,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
