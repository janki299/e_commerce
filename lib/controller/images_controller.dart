import 'package:get/get.dart';

class ImagesController extends GetxController {
  static ImagesController get Instance => Get.find();
  RxString selectedProductImage = "".obs;
  // List<String> getAllPdoctImage(ProductModel product) {
  //   Set<String> images = {};
  //   images.add(product.thumbnail);
  //   selectedProductImage.value = product.thumbnail;
  //   if (product.images != null) {
  //     images.addAll(product.images!);
  //   }
  //   if (product.productVariations != null ||
  //       product.productVariations!.isNotEmpty) {
  //     images.addAll(product.productVariations!.map(
  //       (variation) => variation.image,
  //     ));
  //   }
  //   return images.toList();
  // }
  //
  // void showEnLargeImage(String image) {
  //   Get.to(
  //       fullscreenDialog: true, () => Dialog.fullscreen(child: Text("HEllo")));
  // }
}
