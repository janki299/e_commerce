import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/controller/category_controller.dart';
import 'package:e_commerce/screens/all_product/all_product.dart';
import 'package:e_commerce/screens/home_screen/product_grip.dart';
import 'package:e_commerce/screens/home_screen/promo_slider.dart';
import 'package:e_commerce/screens/subCategariesScreen/subCategories_screen.dart';
import 'package:e_commerce/services/looger.dart';
import 'package:e_commerce/theme_widgets/textthem.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common_widgets/custom_cliper.dart';
import '../../common_widgets/custom_searchbar.dart';
import '../../common_widgets/title_with_button.dart';
import '../../constants/colors.dart';
import '../../services/common_function.dart';
import '../../services/layout.dart';
import 'TappbBar.dart';
import 'Tcircular_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });
  // final ProductModel? model;
  @override
  Widget build(BuildContext context) {
    final bool isDark = CommonFunction.isDarkMode(context);
    final categoryController = Get.put(CategoryController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min, // Prevents infinite height
          children: [
            CustomCircularContainer(
              child: Column(
                mainAxisSize: MainAxisSize.min, // Apply same fix here
                children: [
                  CustomAppBarWithIcon(),
                  const SizedBox(
                    height: 10,
                  ),
                  const CustomSearchBar(
                    text: "Search here",
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 18,
                        ),
                        const TSectionHeading(
                          title: "Popular Categories",
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Obx(() {
                          if (categoryController.isLoading.value) {
                            return const CircularProgressIndicator(
                              color: TColors.primaryColor,
                            );
                          }
                          if (categoryController.featuredCategories.isEmpty) {
                            return Center(
                                child: Text(
                              "No Data Found",
                              style: TTextThem.TTextThemeOnModeBase(context)
                                  .titleLarge,
                            ));
                          }
                          return SizedBox(
                            height: 120,
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount:
                                  categoryController.featuredCategories.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                final category = categoryController
                                    .featuredCategories[index];
                                return TVerticalImage(
                                  isNetworkingImage: true,
                                  OnItemPress: () =>
                                      Get.to(() => SubcategoriesScreen()),
                                  text: category.name,
                                  images: category.image,
                                );
                              },
                            ),
                          );
                        })
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const TPromoSlider(),
                  TSectionHeading(
                    title: "Popular product",
                    onPress: () {
                      Get.to(() => AllProduct());
                    },
                    buttonText: "View all",
                    showActionButton: true,
                  ),
                  productGrid(
                      // product: model!,
                      ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TRoundedImage extends StatelessWidget {
  const TRoundedImage(
      {super.key,
      this.imageUrl,
      this.height,
      this.width,
      this.borderColor = Colors.transparent,
      this.padding,
      this.color = Colors.blue,
      this.isNetworkImage = false,
      this.onPressed});
  final String? imageUrl;
  final double? height, width;
  final Color borderColor;
  final double? padding;
  final Color color;
  final bool isNetworkImage;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: EdgeInsets.all(padding ?? 0),
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: color,
              border: Border.all(color: borderColor)),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: isNetworkImage
                  ? CachedNetworkImage(
                      fit: BoxFit.fill,
                      // height: 50,
                      // width: 50,
                      imageUrl: imageUrl ?? "",
                      // color: Colors.transparent,
                      progressIndicatorBuilder: (context, url, progress) =>
                          const CircularProgressIndicator(
                        color: TColors.primaryColor,
                      ),
                      errorWidget: (context, url, error) {
                        Logger.log("this is error image ", url);
                        return Icon(Icons.error);
                      },
                    )
                  : Image(
                      image: AssetImage(imageUrl ?? ""),
                      fit: BoxFit.fill,
                    )),
        ),
      ),
    );
  }
}

class TVerticalImage extends StatelessWidget {
  const TVerticalImage({
    super.key,
    this.text,
    required this.images,
    this.OnItemPress,
    this.padding = 20,
    this.height = 56,
    this.width = 56,
    this.isNetworkingImage = false,
  });
  final String? text;
  final String images;
  final VoidCallback? OnItemPress;
  final double padding;
  final double height;
  final double width;
  final bool isNetworkingImage;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: OnItemPress,
      child: Padding(
        padding: EdgeInsets.only(right: padding),
        child: Column(
          children: [
            Container(
              height: height,
              width: width,
              padding: EdgeInsets.all(0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Align(
                    alignment: Alignment.center,
                    child: isNetworkingImage
                        ? CachedNetworkImage(
                            fit: BoxFit.fill,
                            // height: 50,
                            // width: 50,
                            imageUrl: images,
                            // color: Colors.transparent,
                            progressIndicatorBuilder:
                                (context, url, progress) =>
                                    CircularProgressIndicator(
                              color: TColors.primaryColor,
                            ),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          )
                        : Image(image: AssetImage(images) as ImageProvider)
                    //     :Icon(
                    //   Icons.person,
                    //   color: Colors.black,
                    //   size: 40,
                    // ),
                    ),
              ),
            ),
            // SizedBox(
            //   height: Layout.height(context) * 0.004,
            // ),
            text != "" && text != null
                ? SizedBox(
                    height: Layout.height(context) * 0.004,
                  )
                : SizedBox(),
            text != "" && text != null
                ? SizedBox(
                    width: 55,
                    child: Text(
                      text ?? "",
                      style: TTextThem.darkTextTheme.bodyMedium,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ))
                : SizedBox()
          ],
        ),
      ),
    );
  }
}

class CustomIconHolder extends StatelessWidget {
  const CustomIconHolder({
    super.key,
    this.onPressed,
    this.icon,
    this.count,
  });
  final VoidCallback? onPressed;
  final Widget? icon;
  final String? count;
  @override
  Widget build(BuildContext context) {
    final isDark = CommonFunction.isDarkMode(context);
    return Stack(
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(
            Icons.shopping_bag_outlined,
            color: isDark ? Colors.white : Colors.black,
          ),
        ),
        Positioned(
          right: 4,
          child: Container(
            height: 20,
            width: 18,
            decoration: BoxDecoration(
              color: isDark ? Colors.white : Colors.black,
              borderRadius: BorderRadius.circular(400),
            ),
            child: Center(
                child: Text(
              count!,
              style: isDark
                  ? TTextThem.darkTextTheme.bodyLarge
                      ?.apply(color: Colors.black)
                  : TTextThem.lightTextTheme.bodyLarge
                      ?.apply(color: Colors.white),
            )),
          ),
        ),
      ],
    );
  }
}

class CustomCircularContainer extends StatelessWidget {
  const CustomCircularContainer({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TCurveWidget(
      child: Container(
        color: TColors.primaryColor,
        child: Stack(
          children: [
            Positioned(
              top: -150,
              right: -250,
              child: TcircularContainer(
                borderColor: Colors.transparent,
                backgroundColor: TColors.lightContainer.withOpacity(0.3),
              ),
            ),
            Positioned(
              top: 100,
              right: -300,
              child: TcircularContainer(
                borderColor: Colors.transparent,
                backgroundColor: TColors.lightContainer.withOpacity(0.3),
              ),
            ),
            child
            // Positioned.fill(
            //   // This ensures child takes up available space properly
            //   child: Column(
            //     mainAxisSize: MainAxisSize.min, // Prevents infinite height
            //     children: [child],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

class TCurveWidget extends StatelessWidget {
  const TCurveWidget({
    super.key,
    this.child,
  });
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TCustomCliper(),
      child: child,
    );
  }
}
