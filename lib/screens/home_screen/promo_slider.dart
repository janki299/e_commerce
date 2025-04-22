import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/constants/colors.dart';
import 'package:e_commerce/controller/banner_controller.dart';
import 'package:e_commerce/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../services/looger.dart';
import 'Tcircular_container.dart';

class TPromoSlider extends StatelessWidget {
  const TPromoSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());
    return Obx(() {
      if (controller.isLoading.value)
        return const CircularProgressIndicator(
          color: TColors.primaryColor,
        );
      if (controller.banners.isEmpty) {
        return const Center(
          child: Text("Data Not Found"),
        );
      } else {
        return Column(
          children: [
            CarouselSlider(
                options: CarouselOptions(
                  viewportFraction: 0.8,
                  onPageChanged: (index, reason) {
                    controller.imageUpdate(index);
                  },
                ),
                items: controller.banners.map((element) {
                  Logger.log("element.imageUrl", element.imageUrl);
                  return TRoundedImage(
                    padding: 9,
                    imageUrl: element.imageUrl,
                    isNetworkImage: true,
                  );
                }).toList()
                // [
                //   TRoundedImage(
                //     imageUrl: "assets/images/communicating.jpg",
                //   ),
                //   TRoundedImage(
                //     imageUrl: "assets/images/telling.jpg",
                //   ),
                //   TRoundedImage(
                //     imageUrl: "assets/images/searching.jpg",
                //   )
                // ],
                ),
            Obx(
              () => Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (int i = 0; i < controller.banners.length; i++)
                    TcircularContainer(
                      width: 20,
                      height: 4,
                      borderColor: Colors.transparent,
                      margin: const EdgeInsets.all(4),
                      backgroundColor: controller.dotIndex.value == i
                          ? TColors.primaryColor
                          : Colors.grey,
                    ),
                ],
              ),
            )
          ],
        );
      }
    });
  }
}
