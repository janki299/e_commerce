import 'package:e_commerce/constants/colors.dart';
import 'package:e_commerce/screens/home_screen/home_screen.dart';
import 'package:e_commerce/services/common_function.dart';
import 'package:e_commerce/theme_widgets/textthem.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common_widgets/custom_rounded_icon.dart';
import '../../theme_widgets/Tshadow.dart';
import '../product_detail_screen/product_detail_screen.dart';
import 'Tcircular_container.dart';

class Tcustomproductcontainer extends StatelessWidget {
  const Tcustomproductcontainer({
    super.key,
    // required this.product,
  });
  // final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final isDark = CommonFunction.isDarkMode(context);
    return GestureDetector(
      onTap: () => Get.to(() => ProductDetailScreen(
          // product: product,
          )),
      child: Container(
        width: 180,
        padding: EdgeInsets.all(1),
        decoration: BoxDecoration(
            boxShadow: [TShadowStyle.verticalProductShadow],
            borderRadius: BorderRadius.circular(12),
            color: isDark ? Colors.white24 : Colors.white70),
        child: Column(
          children: [
            TcircularContainer(
              borderColor: Colors.transparent,
              padding: EdgeInsets.all(8),
              height: 200,
              radius: 12,
              backgroundColor:
                  isDark ? Colors.grey.shade700 : Colors.grey.shade200,
              child: Stack(
                children: [
                  const TRoundedImage(
                    imageUrl: "assets/images/searching.jpg",
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
            Padding(
              padding: EdgeInsets.only(left: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "searching secnature",
                    textAlign: TextAlign.left,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TTextThem.TTextThemeOnModeBase(context).titleSmall,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      Text(
                        "T-sirt",
                        style: TTextThem.TTextThemeOnModeBase(context)
                            .labelMedium
                            ?.apply(color: Colors.grey.shade50),
                        maxLines: 1,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      const Icon(
                        Icons.verified,
                        color: Colors.blue,
                        size: 16,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$35.5",
                        style: TTextThem.TTextThemeOnModeBase(context)
                            .headlineMedium,
                        maxLines: 1,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: isDark ? Colors.white : Colors.black,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(14),
                                bottomRight: Radius.circular(14))),
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
            )
          ],
        ),
      ),
    );
  }
}
