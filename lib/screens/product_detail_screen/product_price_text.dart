import 'package:e_commerce/theme_widgets/textthem.dart';
import 'package:flutter/material.dart';

class TProductPriceText extends StatelessWidget {
  const TProductPriceText(
      {super.key,
      this.currencySign = "\$",
      required this.price,
      this.maxLines = 1,
      this.isLarge = false,
      this.lineThrough = false});
  final String currencySign, price;
  final int maxLines;
  final bool isLarge;
  final bool lineThrough;
  @override
  Widget build(BuildContext context) {
    return Text(
      currencySign + price,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: isLarge
          ? TTextThem.TTextThemeOnModeBase(context).headlineMedium!.apply(
              decoration: lineThrough ? TextDecoration.lineThrough : null)
          : TTextThem.TTextThemeOnModeBase(context).titleLarge!.apply(
              decoration: lineThrough ? TextDecoration.lineThrough : null),
    );
  }
}

class TProductTitleText extends StatelessWidget {
  const TProductTitleText({
    super.key,
    required this.title,
    this.maxLines = 2,
    this.smallSize = false,
    this.trxtAlign = TextAlign.left,
  });
  final String title;
  final int maxLines;
  final bool smallSize;
  final TextAlign? trxtAlign;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: trxtAlign,
      maxLines: maxLines,
      overflow: TextOverflow.visible,
      style: smallSize
          ? TTextThem.TTextThemeOnModeBase(context).labelLarge
          : TTextThem.TTextThemeOnModeBase(context).titleSmall,
    );
  }
}
