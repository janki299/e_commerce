import 'package:e_commerce/common_widgets/appbar.dart';
import 'package:e_commerce/common_widgets/customGridView.dart';
import 'package:e_commerce/common_widgets/title_with_button.dart';
import 'package:e_commerce/screens/all_brand_screen/brand_products.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../store_screen/storeGridComponent.dart';

class AllBrandScreen extends StatelessWidget {
  const AllBrandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text("Brand"),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              TSectionHeading(title: "Brands"),
              SizedBox(
                height: 12,
              ),
              TGridLayout(
                itemCount: 18,
                mainAxisExtent: 80,
                itemBuilder: (p0, p1) => Storegridcomponent(
                  showBorder: true,
                  onTap: () => Get.to(() => BrandProducts()),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
