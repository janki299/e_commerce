import 'package:flutter/material.dart';

import '../../common_widgets/title_with_button.dart';
import '../../services/common_function.dart';
import '../../theme_widgets/textthem.dart';
import '../home_screen/Tcircular_container.dart';

class TBillingAmountSection extends StatelessWidget {
  const TBillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = CommonFunction.isDarkMode(context);
    return Column(
      children: [
        TSectionHeading(
          title: "Payment Method",
          buttonText: "Changes",
          onPress: () {},
          // showActionButton: true,
        ),
        SizedBox(
          height: 12,
        ),
        Row(
          children: [
            TRoundedContainer(
              width: 60,
              height: 35,
              padding: EdgeInsets.all(8),
              child: Image(
                image: AssetImage("assets/images/searching.jpg"),
                fit: BoxFit.contain,
              ),
              backgroundColor: isDark ? Colors.black : Colors.white10,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "PayPal ",
              style: TTextThem.TTextThemeOnModeBase(context).bodyMedium,
            )
          ],
        )
      ],
    );
  }
}
