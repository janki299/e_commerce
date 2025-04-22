import 'package:flutter/material.dart';

import '../../theme_widgets/textthem.dart';
import '../home_screen/home_screen.dart';
import '../product_detail_screen/product_meta_data.dart';
import '../product_detail_screen/product_price_text.dart';

class TCartItem extends StatelessWidget {
  const TCartItem({
    super.key,
    required this.isDark,
  });

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TRoundedImage(
          imageUrl: "assets/images/communicating.jpg",
          height: 60,
          width: 60,
          borderColor: Colors.grey,
          color: isDark ? Colors.grey.shade200 : Colors.grey.shade900,
        ),
        SizedBox(
          width: 16,
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TProductWithVerifyIcon(
                title: "hiy",
              ),
              Flexible(
                flex: 0,
                child: TProductTitleText(
                    title:
                        "blacj kji igfgfgfgfdgfgdfgfg dfg ggfgfgf fggfgfgduiuu"),
              ),
              Text.rich(TextSpan(children: [
                TextSpan(
                    text: "color ",
                    style: TTextThem.TTextThemeOnModeBase(context).bodySmall),
                TextSpan(
                    text: "Green ",
                    style: TTextThem.TTextThemeOnModeBase(context).bodyLarge),
                TextSpan(
                    text: "Size  ",
                    style: TTextThem.TTextThemeOnModeBase(context).bodySmall),
                TextSpan(
                    text: "UK 08 ",
                    style: TTextThem.TTextThemeOnModeBase(context).bodyLarge)
              ]))
            ],
          ),
        )
      ],
    );
  }
}
