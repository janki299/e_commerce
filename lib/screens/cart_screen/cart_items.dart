import 'package:e_commerce/screens/cart_screen/cart_item.dart';
import 'package:e_commerce/screens/cart_screen/cart_screen.dart';
import 'package:flutter/material.dart';

import '../product_detail_screen/product_price_text.dart';

class TCartItems extends StatelessWidget {
  const TCartItems({
    super.key,
    required this.isDark,
    this.showAddRemoveButton = true,
  });

  final bool isDark;
  final bool showAddRemoveButton;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Column(
          children: [
            TCartItem(isDark: isDark),
            if (showAddRemoveButton)
              SizedBox(
                height: 6,
              ),
            if (showAddRemoveButton)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 70,
                      ),
                      TProductQuantityAddRemove(isDark: isDark),
                    ],
                  ),
                  TProductPriceText(price: "789")
                ],
              )
          ],
        );
      },
      itemCount: 2,
      separatorBuilder: (context, index) => SizedBox(
        height: 22,
      ),
    );
  }
}
