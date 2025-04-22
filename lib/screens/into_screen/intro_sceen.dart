import 'package:e_commerce/constants/colors.dart';
import 'package:e_commerce/theme_widgets/textthem.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'onbording_getx_controller.dart';

class IntroSceen extends StatefulWidget {
  const IntroSceen({super.key});

  @override
  State<IntroSceen> createState() => _IntroSceenState();
}

class _IntroSceenState extends State<IntroSceen> {
  @override
  Widget build(BuildContext context) {
    var onThemeChange = Theme.of(context).brightness == Brightness.dark;
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: [
              onBoardWidget(
                body: "wellcome to my app",
                title: "App to my WellCome",
                image: "assets/images/telling.jpg",
              ),
              onBoardWidget(
                body: "wellcome to my app",
                title: "App to my WellCome",
                image: "assets/images/searching.jpg",
              ),
              onBoardWidget(
                body: "wellcome to my app",
                title: "App to my WellCome",
                image: "assets/images/communicating.jpg",
              ),
            ],
          ),
          Positioned(
            top: 50,
            right: 20,
            child: GestureDetector(
                onTap: () {
                  controller.skipPage();
                },
                child: Container(
                  color: TColors.primaryColor,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Skip",
                      style: onThemeChange
                          ? TTextThem.darkTextTheme.headlineSmall
                          : TTextThem.lightTextTheme.headlineSmall,
                    ),
                  ),
                )),
          ),
          Positioned(
            bottom: 10,
            left: 20,
            height: 90,
            child: SmoothPageIndicator(
              effect: ExpandingDotsEffect(
                activeDotColor: onThemeChange ? Colors.white : Colors.black,
              ),
              controller: controller.pageController,
              onDotClicked: controller.dotNavigationClick,
              count: 3,
            ),
          ),
          Positioned(
            bottom: 50,
            right: 20,
            child: GestureDetector(
                onTap: () {
                  controller.nextPage();
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: TColors.primaryColor,
                      borderRadius: BorderRadius.circular(50)),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Icon(Icons.arrow_forward_ios_rounded),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}

class onBoardWidget extends StatelessWidget {
  const onBoardWidget({
    super.key,
    this.title,
    this.body,
    this.image,
  });
  final String? title;
  final String? body;
  final String? image;

  @override
  Widget build(BuildContext context) {
    var onThemeChange = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 200, horizontal: 50),
      child: Center(
        child: Column(
          children: [
            Image(
              image: AssetImage(image!),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              title!,
              style: onThemeChange
                  ? TTextThem.darkTextTheme.titleSmall
                  : TTextThem.lightTextTheme.titleSmall,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              body!,
              style: onThemeChange
                  ? TTextThem.darkTextTheme.titleSmall
                  : TTextThem.lightTextTheme.titleSmall,
            ),
          ],
        ),
      ),
    );
  }
}
