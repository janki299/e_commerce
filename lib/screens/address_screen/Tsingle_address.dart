import 'package:e_commerce/constants/colors.dart';
import 'package:e_commerce/services/common_function.dart';
import 'package:e_commerce/theme_widgets/textthem.dart';
import 'package:flutter/material.dart';

import '../home_screen/Tcircular_container.dart';

class TSingleAddress extends StatelessWidget {
  const TSingleAddress(
      {super.key, required this.address, required this.selectedAddress});
  final String address;
  final bool selectedAddress;
  @override
  Widget build(BuildContext context) {
    final isDark = CommonFunction.isDarkMode(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TRoundedContainer(
          width: double.infinity,
          backgroundColor:
              selectedAddress ? TColors.primaryColor : Colors.transparent,
          borderColor: selectedAddress
              ? Colors.transparent
              : isDark
                  ? Colors.grey.shade200
                  : Colors.grey,
          margin: EdgeInsets.all(8),
          padding: EdgeInsets.all(16),
          radius: 8,
          child: Stack(
            children: [
              Positioned(
                right: 5,
                child: Icon(
                  selectedAddress ? Icons.check_circle_rounded : null,
                  color: selectedAddress
                      ? isDark
                          ? Colors.white
                          : Colors.black
                      : null,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "John sjdsik",
                    maxLines: 3,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    style:
                        TTextThem.TTextThemeOnModeBase(context).headlineSmall,
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    "+91 8748389789",
                    maxLines: 3,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    style: TTextThem.TTextThemeOnModeBase(context).titleSmall,
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    "hfjdfjdhu ffgrrew wwewewhf dkldfjk kjw jdfjdhu ffgrrewwwewewhfjdfjdhu ffgrrewwwewew",
                    maxLines: 3,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    style: TTextThem.TTextThemeOnModeBase(context).bodySmall,
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
