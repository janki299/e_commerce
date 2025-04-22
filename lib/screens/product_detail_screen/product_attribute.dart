import 'package:e_commerce/common_widgets/title_with_button.dart';
import 'package:e_commerce/screens/home_screen/Tcircular_container.dart';
import 'package:e_commerce/screens/product_detail_screen/product_price_text.dart';
import 'package:e_commerce/services/common_function.dart';
import 'package:flutter/material.dart';

import '../../theme_widgets/textthem.dart';
import 'custom_chip.dart';

class TProductAttribute extends StatelessWidget {
  const TProductAttribute({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = CommonFunction.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        children: [
          TcircularContainer(
            radius: 10,
            height: 110,
            backgroundColor: isDark ? Colors.blueGrey : Colors.grey.shade300,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  TSectionHeading(title: "variation"),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            TProductTitleText(
                              title: "Price",
                              smallSize: true,
                            ),
                            Text(
                              "\$250",
                              style: TTextThem.TTextThemeOnModeBase(context)
                                  .titleSmall!
                                  .apply(
                                      decoration: TextDecoration.lineThrough),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            TProductPriceText(price: "20")
                          ],
                        ),
                        Row(
                          children: [
                            TProductTitleText(
                              title: "Stoc k :",
                              smallSize: true,
                            ),
                            Text(
                              "In Stock",
                              style: TTextThem.TTextThemeOnModeBase(context)
                                  .titleLarge,
                            ),
                          ],
                        ),
                        TProductTitleText(
                          title: "This is the description of product 4 lines",
                          smallSize: true,
                          maxLines: 2,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TSectionHeading(title: "Colors"),
              SizedBox(
                height: 10,
              ),
              Wrap(
                children: [
                  CustomChip(
                    text: "green",
                    selected: true,
                    onSelectItem: (p0) {},
                  ),
                  CustomChip(
                    text: "purple",
                    selected: false,
                    onSelectItem: (p0) {},
                  ),
                  CustomChip(
                    text: "orange",
                    selected: false,
                    onSelectItem: (p0) {},
                  ),
                  CustomChip(
                    text: "blue",
                    selected: false,
                    onSelectItem: (p0) {},
                  )
                ],
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TSectionHeading(title: "Size"),
              SizedBox(
                height: 10,
              ),
              Wrap(
                spacing: 8,
                children: [
                  CustomChip(
                    text: "E0 54",
                    selected: true,
                    onSelectItem: (p0) {},
                  ),
                  CustomChip(
                    text: "E0 89",
                    selected: false,
                    onSelectItem: (p0) {},
                  ),
                  CustomChip(
                    text: "Eu 90",
                    selected: false,
                    onSelectItem: (p0) {},
                  ),
                  CustomChip(
                    text: "E000",
                    selected: false,
                    onSelectItem: (p0) {},
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
