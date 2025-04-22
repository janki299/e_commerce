import 'package:e_commerce/common_widgets/appbar.dart';
import 'package:e_commerce/theme_widgets/textthem.dart';
import 'package:flutter/material.dart';

import 'orderList_item.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          "My ORder",
          style: TTextThem.TTextThemeOnModeBase(context).titleLarge,
        ),
        showBackArrow: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [OrderListItem()],
        ),
      ),
    );
  }
}
