import 'package:e_commerce/screens/product_detail_screen/product_price_text.dart';
import 'package:e_commerce/services/common_function.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../theme_widgets/textthem.dart';
import '../home_screen/Tcircular_container.dart';
import '../home_screen/home_screen.dart';

class ProductMetaData extends StatelessWidget {
  const ProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = CommonFunction.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            TcircularContainer(
              height: 30,
              width: 40,
              radius: 4,
              borderColor: Colors.transparent,
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
              backgroundColor: TColors.secondary.withOpacity(0.8),
              child: Text(
                textAlign: TextAlign.center,
                "78%",
                style: TTextThem.lightTextTheme.bodySmall
                    ?.apply(color: Colors.black),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "\$250",
              style: TTextThem.TTextThemeOnModeBase(context)
                  .bodySmall!
                  .apply(decoration: TextDecoration.lineThrough),
            ),
            const SizedBox(
              width: 5,
            ),
            const TProductPriceText(
              price: "175",
              lineThrough: false,
              isLarge: true,
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        const TProductTitleText(title: "green nike sport short"),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            const TProductTitleText(title: "Status"),
            const SizedBox(
              width: 10,
            ),
            Text(
              "In Stock",
              style: TTextThem.TTextThemeOnModeBase(context).titleMedium,
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            TRoundedImage(
              height: 32,
              width: 32,
              imageUrl: "assets/images/searching.jpg",
            ),
            SizedBox(
              width: 10,
            ),
            TProductWithVerifyIcon(title: "T-sirt"),
          ],
        ),
      ],
    );
  }
}

class TProductWithVerifyIcon extends StatelessWidget {
  const TProductWithVerifyIcon({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TTextThem.TTextThemeOnModeBase(context)
              .bodySmall
              ?.apply(color: Colors.grey),
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
    );
  }
}
