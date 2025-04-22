import 'package:e_commerce/common_widgets/appbar.dart';
import 'package:e_commerce/common_widgets/title_with_button.dart';
import 'package:e_commerce/constants/colors.dart';
import 'package:e_commerce/screens/settings_screen/profile_detail_widget.dart';
import 'package:e_commerce/theme_widgets/textthem.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/user_controller.dart';
import '../home_screen/home_screen.dart';
import 'change_name.dart';

class TProfileDetailScreen extends StatelessWidget {
  const TProfileDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
        appBar: TAppBar(
          showBackArrow: true,
          title: Text("Profile"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.maxFinite,
                  child: Column(
                    children: [
                      Obx(() {
                        final networkImage =
                            controller.user.value.profilePicture;
                        final image = networkImage.isNotEmpty
                            ? networkImage
                            : "assets/images/telling.jpg";

                        return !controller.imageUploading.value
                            ? TVerticalImage(
                                isNetworkingImage: networkImage.isNotEmpty,
                                height: 100,
                                width: 100,
                                images: image,
                              )
                            : CircularProgressIndicator(
                                color: TColors.primaryColor,
                              );
                      }),
                      TextButton(
                          onPressed: () => controller.uploadUserProfilePicture(
                              controller.user.value.profilePicture),
                          child: Text(
                            "Changes Profile Picture",
                            style: TTextThem.TTextThemeOnModeBase(context)
                                .bodySmall,
                          ))
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(),
                SizedBox(
                  height: 20,
                ),
                TSectionHeading(
                  title: "Profile Information",
                  showActionButton: false,
                ),
                SizedBox(
                  height: 10,
                ),
                TProfileDetailWidget(
                  onPressed: () => Get.to(() => ChangeName()),
                  title: 'Name',
                  value: controller.user.value.fullName,
                ),
                TProfileDetailWidget(
                  onPressed: () {},
                  title: 'UserName',
                  value: controller.user.value.username,
                ),
                SizedBox(
                  height: 16,
                ),
                Divider(),
                TSectionHeading(
                  title: "Profile Information",
                  showActionButton: false,
                ),
                SizedBox(
                  height: 10,
                ),
                TProfileDetailWidget(
                  onPressed: () {},
                  title: 'User ID',
                  value: controller.user.value.id,
                ),
                TProfileDetailWidget(
                  onPressed: () {},
                  title: 'E-mail',
                  value: controller.user.value.email,
                ),
                TProfileDetailWidget(
                  onPressed: () {},
                  title: 'Phone Number',
                  value: controller.user.value.phoneNumber,
                ),
                TProfileDetailWidget(
                  onPressed: () {},
                  title: 'Gender',
                  value: 'coding with t',
                ),
                TProfileDetailWidget(
                  onPressed: () {},
                  title: 'Date of Birth',
                  value: '748975',
                ),
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: TextButton(
                    child: Text(
                      "Close account",
                      style: TTextThem.TTextThemeOnModeBase(context)
                          .bodyMedium!
                          .apply(color: Colors.red),
                    ),
                    onPressed: () {},
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
