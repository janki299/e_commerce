import 'package:e_commerce/common_widgets/title_with_button.dart';
import 'package:e_commerce/services/common_function.dart';
import 'package:e_commerce/theme_widgets/textthem.dart';
import 'package:flutter/material.dart';

class TBillingAddressSection extends StatelessWidget {
  const TBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = CommonFunction.isDarkMode(context);
    return Column(
      children: [
        TSectionHeading(
          title: "Shopping address",
          buttonText: "Changes",
          onPress: () {},
          // showActionButton: true,
        ),
        Text(
          "ch hwwueh h",
          style: TTextThem.TTextThemeOnModeBase(context).bodySmall,
        ),
        SizedBox(
          height: 12,
        ),
        Row(
          children: [
            Icon(
              Icons.phone,
              size: 16,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              softWrap: true,
              "8738947893478",
              style: TTextThem.TTextThemeOnModeBase(context).bodySmall,
            )
          ],
        ),
        Row(
          children: [
            Icon(
              Icons.location_on_outlined,
              size: 16,
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
                child: Text(
              softWrap: true,
              "South Asia ,67869 hgg",
              style: TTextThem.TTextThemeOnModeBase(context).bodySmall,
            ))
          ],
        )
      ],
    );
  }
}
