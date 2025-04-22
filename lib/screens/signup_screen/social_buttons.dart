import 'package:e_commerce/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';

class TSocialButtons extends StatelessWidget {
  const TSocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 100),
      child: Row(
        children: [
          Container(
              decoration: BoxDecoration(
                  color: TColors.primaryColor,
                  borderRadius: BorderRadius.circular(100)),
              child: IconButton(
                  onPressed: () => controller.signinWithGoogle(),
                  icon: Icon(
                    Icons.g_mobiledata_outlined,
                    color: Colors.white,
                    size: 30,
                  ))),
          SizedBox(
            width: 20,
          ),
          Container(
              decoration: BoxDecoration(
                  color: TColors.primaryColor,
                  borderRadius: BorderRadius.circular(100)),
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.facebook,
                    color: Colors.white,
                    size: 30,
                  )))
        ],
      ),
    );
  }
}
