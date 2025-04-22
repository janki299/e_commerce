import 'package:e_commerce/screens/store_screen/storeGridComponent.dart';
import 'package:flutter/material.dart';

import '../../services/common_function.dart';
import '../../services/layout.dart';
import '../home_screen/Tcircular_container.dart';

class BodyOfTapBarView extends StatelessWidget {
  const BodyOfTapBarView({super.key, required this.image});
  final List<String> image;
  @override
  Widget build(BuildContext context) {
    final isDark = CommonFunction.isDarkMode(context);
    return TcircularContainer(
      height: 260,
      radius: 4,
      borderColor: Colors.grey,
      backgroundColor: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.only(left: 12),
        child: Column(
          children: [
            Storegridcomponent(
              showBorder: false,
              height: Layout.height(context) * 0.096,
            ),
            Row(
                children: image.map(
              (image) {
                return items3Images(image, context, isDark: isDark);
              },
            ).toList())
          ],
        ),
      ),
    );
  }

  Widget items3Images(String image, context, {required bool isDark}) {
    return Expanded(
      child: TcircularContainer(
          radius: 8,
          width: Layout.width(context) * 0.27,
          height: Layout.height(context) * 0.2,
          backgroundColor: isDark
              ? Colors.grey.withOpacity(0.7)
              : Colors.grey.withOpacity(0.7),
          borderColor: Colors.transparent,
          margin: EdgeInsets.only(right: 10),
          padding: EdgeInsets.only(right: 10),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Image(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/searching.jpg")),
          )),
    );
  }
}
