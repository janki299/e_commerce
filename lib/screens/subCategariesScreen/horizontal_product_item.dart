import 'package:e_commerce/screens/home_screen/Tcircular_container.dart';
import 'package:e_commerce/screens/home_screen/home_screen.dart';
import 'package:e_commerce/screens/product_detail_screen/product_meta_data.dart';
import 'package:e_commerce/screens/product_detail_screen/product_price_text.dart';
import 'package:e_commerce/services/common_function.dart';
import 'package:flutter/material.dart';

import '../../common_widgets/custom_rounded_icon.dart';
import '../../constants/colors.dart';
import '../../theme_widgets/textthem.dart';

class HorizontalProductItem extends StatelessWidget {
  const HorizontalProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = CommonFunction.isDarkMode(context);
    return Container(
      width: 310,
      decoration: BoxDecoration(
          boxShadow: [BoxShadow(color: Colors.black)],
          color: isDark ? Colors.black : Colors.white,
          border: Border.all(color: isDark ? Colors.white : Colors.black),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          TRoundedContainer(
            height: 120,
            radius: 10,
            padding: EdgeInsets.all(8),
            backgroundColor: isDark ? Colors.black : Colors.white,
            child: Stack(
              children: [
                SizedBox(
                  height: 120,
                  width: 120,
                  child: TRoundedImage(
                    imageUrl: "assets/images/searching.jpg",
                  ),
                ),
                TcircularContainer(
                  height: 30,
                  width: 40,
                  radius: 4,
                  borderColor: Colors.transparent,
                  padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                  backgroundColor: TColors.secondary.withOpacity(0.8),
                  child: Text(
                    textAlign: TextAlign.center,
                    "78%",
                    style: TTextThem.lightTextTheme.bodySmall
                        ?.apply(color: Colors.black),
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: TCircularIcon(
                    isDark: isDark,
                    icon: Icons.favorite,
                    onIconClick: () {},
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 170,
            child: Padding(
              padding: const EdgeInsets.only(top: 8, left: 8),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TProductTitleText(
                        title: "Green Nice HAlf shirt yuyu",
                        smallSize: true,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TProductWithVerifyIcon(title: "Nike")
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(child: TProductPriceText(price: "\$787")),
                      Container(
                        decoration: BoxDecoration(
                            color: isDark ? Colors.white : Colors.black,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(14),
                                bottomRight: Radius.circular(10))),
                        child: SizedBox(
                          width: 36,
                          height: 36,
                          child: Icon(
                            Icons.add,
                            color: isDark ? Colors.black : Colors.white,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
