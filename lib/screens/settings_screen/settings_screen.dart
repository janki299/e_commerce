import 'package:e_commerce/common_widgets/appbar.dart';
import 'package:e_commerce/data/repositories/authentication_repository.dart';
import 'package:e_commerce/screens/address_screen/address_screen.dart';
import 'package:e_commerce/screens/order_screen/order_screen.dart';
import 'package:e_commerce/screens/settings_screen/profile_detail_screen.dart';
import 'package:e_commerce/screens/settings_screen/settings-menu_tile.dart';
import 'package:e_commerce/screens/settings_screen/user_profile_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common_widgets/custom_button.dart';
import '../../common_widgets/title_with_button.dart';
import '../../constants/colors.dart';
import '../home_screen/home_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
      children: [
        CustomCircularContainer(
          child: Column(
            children: [
              const TAppBar(
                title: Text("Account"),
              ),

              // Container(
              //   child: Text("gegeuw"),
              // )

              TUserProfileTile(
                onEditTAp: () => Get.to(() => TProfileDetailScreen()),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              const TSectionHeading(
                title: "formated",
              ),
              const SizedBox(
                height: 15,
              ),
              TSettingsMenuTile(
                  icon: Icons.home_sharp,
                  title: "My Addresses",
                  subTitle: "set shoping delivery address",
                  color: TColors.primaryColor,
                  onTap: () {
                    Get.to(() => AddressScreen());
                  },
                  size: 33),
              TSettingsMenuTile(
                  icon: Icons.shopping_cart,
                  title: "My Cart",
                  subTitle: "set shoping delivery address",
                  color: TColors.primaryColor,
                  onTap: () {},
                  size: 33),
              TSettingsMenuTile(
                  icon: Icons.shopping_bag,
                  title: "My Order",
                  subTitle: "set shoping delivery address",
                  color: TColors.primaryColor,
                  onTap: () => Get.to(() => OrderScreen()),
                  size: 33),
              TSettingsMenuTile(
                  icon: Icons.monetization_on_sharp,
                  title: "Bank Account",
                  subTitle: "set shoping delivery address",
                  color: TColors.primaryColor,
                  onTap: () {},
                  size: 33),
              TSettingsMenuTile(
                  icon: Icons.percent_rounded,
                  title: "My Coupons",
                  subTitle: "set shoping delivery address",
                  color: TColors.primaryColor,
                  onTap: () {},
                  size: 33),
              TSettingsMenuTile(
                  icon: Icons.notifications,
                  title: "Notification",
                  subTitle: "set shoping delivery address",
                  color: TColors.primaryColor,
                  onTap: () {},
                  size: 33),
              TSettingsMenuTile(
                  icon: Icons.privacy_tip_sharp,
                  title: "Accont Privacy",
                  subTitle: "set shoping delivery address",
                  color: TColors.primaryColor,
                  onTap: () {},
                  size: 33),
              const SizedBox(
                height: 22,
              ),
              const TSectionHeading(title: "App Settings"),
              const SizedBox(
                height: 16,
              ),
              TSettingsMenuTile(
                  icon: Icons.upload_file_rounded,
                  title: "Load Data",
                  subTitle: "set shoping delivery address",
                  color: TColors.primaryColor,
                  onTap: () {},
                  size: 33),
              TSettingsMenuTile(
                  icon: Icons.location_on_outlined,
                  title: "GeoLocation",
                  subTitle: "set shoping delivery address",
                  color: TColors.primaryColor,
                  onTap: () {},
                  trailing: Switch(
                    value: true,
                    onChanged: (value) {},
                  ),
                  size: 33),
              TSettingsMenuTile(
                  icon: Icons.security_rounded,
                  title: "Safe Mode",
                  subTitle: "set shoping delivery address",
                  color: TColors.primaryColor,
                  onTap: () {},
                  trailing: Switch(
                    value: false,
                    onChanged: (value) {},
                  ),
                  size: 33),
              TSettingsMenuTile(
                  icon: Icons.image,
                  title: "AD Image Quality",
                  subTitle: "set shoping delivery address",
                  color: TColors.primaryColor,
                  onTap: () {},
                  trailing: Switch(
                    value: false,
                    onChanged: (value) {},
                  ),
                  size: 33),
              const SizedBox(
                height: 40,
              ),
              CustomButton(
                isOutlined: true,
                color: Colors.transparent,
                text: "LogOut",
                onPressed: () {
                  AuthenticationRepository.instance.logout();
                },
              )
            ],
          ),
        )
      ],
    )));
  }
}
