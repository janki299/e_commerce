import 'package:e_commerce/theme_widgets/textthem.dart';
import 'package:flutter/material.dart';

class TBillingPaymentSection extends StatelessWidget {
  const TBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "subTotal",
              style: TTextThem.TTextThemeOnModeBase(context).titleSmall,
            ),
            Text(
              "\$87",
              style: TTextThem.TTextThemeOnModeBase(context).headlineSmall,
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Shipping",
              style: TTextThem.TTextThemeOnModeBase(context).titleSmall,
            ),
            Text(
              "\$87",
              style: TTextThem.TTextThemeOnModeBase(context).headlineSmall,
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Order Total",
              style: TTextThem.TTextThemeOnModeBase(context).titleSmall,
            ),
            Text(
              "\$87",
              style: TTextThem.TTextThemeOnModeBase(context).headlineSmall,
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
