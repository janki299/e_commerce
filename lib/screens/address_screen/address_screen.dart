import 'package:e_commerce/common_widgets/appbar.dart';
import 'package:e_commerce/constants/colors.dart';
import 'package:e_commerce/screens/address_screen/Tsingle_address.dart';
import 'package:e_commerce/theme_widgets/textthem.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import 'add_address_sreen.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(
          () => AddAddressScreen(),
        ),
        child: Icon(
          Icons.add,
          size: 25,
        ),
        backgroundColor: TColors.primaryColor,
      ),
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          "Addresses",
          style: TTextThem.TTextThemeOnModeBase(context).titleLarge,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TSingleAddress(address: "djkshdj", selectedAddress: true),
              TSingleAddress(address: "djkshdj", selectedAddress: false)
            ],
          ),
        ),
      ),
    );
  }
}
