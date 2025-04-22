import 'package:e_commerce/common_widgets/appbar.dart';
import 'package:e_commerce/common_widgets/custom_rounded_icon.dart';
import 'package:e_commerce/constants/colors.dart';
import 'package:e_commerce/screens/cart_screen/cart_items.dart';
import 'package:e_commerce/services/common_function.dart';
import 'package:e_commerce/theme_widgets/textthem.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../checkout_screen/check_out_screen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = CommonFunction.isDarkMode(context);
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          "Cart",
          style: TTextThem.TTextThemeOnModeBase(context).titleLarge,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TCartItems(isDark: isDark),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10),
        child: ElevatedButton(
          onPressed: () => Get.to(() => CheckOutScreen()),
          child: Text("CheckOut \$256"),
        ),
      ),
    );
  }
}

class TProductQuantityAddRemove extends StatelessWidget {
  const TProductQuantityAddRemove({
    super.key,
    required this.isDark,
  });

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        TCircularIcon(
            backgroundColor: isDark ? Colors.grey : Colors.grey,
            width: 32,
            height: 32,
            size: 16,
            isDark: isDark,
            color: isDark ? Colors.white : Colors.black,
            onIconClick: () {},
            icon: Icons.remove),
        SizedBox(
          width: 10,
        ),
        Text(
          "2",
          style: TTextThem.TTextThemeOnModeBase(context).titleSmall,
        ),
        SizedBox(
          width: 10,
        ),
        TCircularIcon(
            backgroundColor: TColors.primaryColor,
            width: 32,
            height: 32,
            size: 16,
            isDark: isDark,
            color: isDark ? Colors.white : Colors.black,
            onIconClick: () {},
            icon: Icons.add),
      ],
    );
  }
}
