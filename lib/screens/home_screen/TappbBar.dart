import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common_widgets/appbar.dart';
import '../../controller/user_controller.dart';
import '../../theme_widgets/textthem.dart';
import '../cart_screen/cart_screen.dart';
import 'home_screen.dart';

class CustomAppBarWithIcon extends StatelessWidget {
  const CustomAppBarWithIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return TAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Welcome to shopping day",
            style: TTextThem.lightTextTheme.headlineSmall,
          ),
          Obx(
            () {
              if (controller.profileLoading.value) {
                return SizedBox();
              } else {
                return Text(
                  controller.user.value.firstName,
                  style: TTextThem.lightTextTheme.titleSmall,
                );
              }
            },
          ),
        ],
      ),
      action: [
        CustomIconHolder(
          onPressed: () {
            Get.to(() => CartScreen());
          },
          count: "3",
        ),
      ],
    );
  }
}
