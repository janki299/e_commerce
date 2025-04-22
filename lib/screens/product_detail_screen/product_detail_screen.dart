import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/common_widgets/appbar.dart';
import 'package:e_commerce/common_widgets/custom_rounded_icon.dart';
import 'package:e_commerce/common_widgets/title_with_button.dart';
import 'package:e_commerce/constants/colors.dart';
import 'package:e_commerce/controller/images_controller.dart';
import 'package:e_commerce/screens/home_screen/home_screen.dart';
import 'package:e_commerce/screens/product_detail_screen/Tbotton_widget_product_detail.dart';
import 'package:e_commerce/screens/product_detail_screen/product_attribute.dart';
import 'package:e_commerce/screens/product_detail_screen/product_meta_data.dart';
import 'package:e_commerce/screens/product_detail_screen/product_review_screen/product_review_screen.dart';
import 'package:e_commerce/services/common_function.dart';
import 'package:e_commerce/theme_widgets/textthem.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({
    super.key,
  });
  // final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final isDark = CommonFunction.isDarkMode(context);
    return Scaffold(
        bottomNavigationBar: TBottomWidgetProductDetail(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              TProductImageSlider(
                isDark: isDark,
                // productModel: product,
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  children: [
                    TRatingAndShare(),
                    ProductMetaData(),
                    TProductAttribute(),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () {}, child: Text("CheckOut"))),
                    SizedBox(
                      height: 10,
                    ),
                    TSectionHeading(title: "Description"),
                    SizedBox(
                      height: 10,
                    ),
                    ReadMoreText(
                      "This is product for BLue Sleaves less vest,There are moe things like this tsirt  jfjfioeuioru weiuwueiwue ieuwiwqueiowqeu search for more on site ",
                      trimLines: 2,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: "show More",
                      trimExpandedText: "less",
                      moreStyle:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                      lessStyle:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    ),
                    Divider(),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TSectionHeading(
                          title: "Review(199)",
                          onPress: () {},
                        ),
                        IconButton(
                            onPressed: () {
                              Get.to(() => ProductReviewScreen());
                            },
                            icon: Icon(Icons.arrow_forward_ios_rounded))
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

class TRatingAndShare extends StatelessWidget {
  const TRatingAndShare({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(
              Icons.star,
              color: Colors.amber,
              size: 24,
            ),
            SizedBox(
              width: 20,
            ),
            Text.rich(TextSpan(children: [
              TextSpan(
                  text: "5.0",
                  style: TTextThem.TTextThemeOnModeBase(context).bodyLarge),
              TextSpan(text: " (199)")
            ]))
          ],
        ),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.share,
              size: 29,
            ))
      ],
    );
  }
}

class TProductImageSlider extends StatelessWidget {
  const TProductImageSlider({
    super.key,
    required this.isDark,
    // required this.productModel,
  });

  final bool isDark;
  // final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ImagesController());
    // final images = controller.getAllPdoctImage(productModel);
    return TCurveWidget(
      child: Container(
        color: isDark ? Colors.black : Colors.white,
        child: Stack(
          children: [
            SizedBox(
                height: 400,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(child: Obx(
                    () {
                      final image = controller.selectedProductImage.value;
                      return GestureDetector(
                        // onTap: () => controller.showEnLargeImage(image),
                        child: CachedNetworkImage(
                          imageUrl: image,
                          progressIndicatorBuilder: (context, url, progress) =>
                              CircularProgressIndicator(
                            value: progress.progress,
                            color: TColors.primaryColor,
                          ),
                        ),
                      );
                    },
                  )),
                )),
            Positioned(
              bottom: 30,
              right: 0,
              left: 24,
              child: SizedBox(
                height: 120,
                child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Obx(() {
                        // final imageSelect =
                        //     controller.selectedProductImage.value ==
                        //         images[index];
                        return const TRoundedImage(
                            padding: 15,
                            width: 80,
                            isNetworkImage: true,
                            borderColor: Colors.blue,
                            // imageSelect ? Colors.blue : Colors.transparent,
                            imageUrl: "assets/images/telling.jpg"
                            // images[index] ?? "assets/images/telling.jpg",
                            );
                      });
                    },
                    separatorBuilder: (context, index) => SizedBox(),
                    itemCount: 4
                    // images.length
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 14, left: 12, right: 12),
              child: TAppBar(
                showBackArrow: true,
                action: [
                  TCircularIcon(
                      isDark: isDark, onIconClick: () {}, icon: Icons.favorite)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
