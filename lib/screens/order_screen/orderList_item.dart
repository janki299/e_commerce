import 'package:e_commerce/screens/home_screen/Tcircular_container.dart';
import 'package:e_commerce/services/common_function.dart';
import 'package:e_commerce/theme_widgets/textthem.dart';
import 'package:flutter/material.dart';

class OrderListItem extends StatelessWidget {
  const OrderListItem({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = CommonFunction.isDarkMode(context);
    return Expanded(
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: 10,
        separatorBuilder: (context, index) => SizedBox(
          height: 10,
        ),
        itemBuilder: (context, index) => TRoundedContainer(
          radius: 8,
          padding: EdgeInsets.all(8),
          borderColor: isDark ? Colors.white : Colors.black,
          backgroundColor: isDark ? Colors.black : Colors.white10,
          child: Column(
            children: [
              Row(
                children: [
                  Icon(Icons.local_shipping),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Processing",
                          style: TTextThem.TTextThemeOnModeBase(context)
                              .titleLarge,
                        ),
                        Text(
                          "07 Nov 2024",
                          style: TTextThem.TTextThemeOnModeBase(context)
                              .headlineSmall,
                        )
                      ],
                    ),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 16,
                      ))
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Icon(Icons.card_giftcard_rounded),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Order",
                                style: TTextThem.TTextThemeOnModeBase(context)
                                    .titleSmall,
                              ),
                              Text(
                                "jdhf87",
                                style: TTextThem.TTextThemeOnModeBase(context)
                                    .bodySmall,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Icon(Icons.calendar_month),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Shipping Date",
                                style: TTextThem.TTextThemeOnModeBase(context)
                                    .titleSmall,
                              ),
                              Text(
                                "3 Feb 2025",
                                style: TTextThem.TTextThemeOnModeBase(context)
                                    .bodySmall,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
