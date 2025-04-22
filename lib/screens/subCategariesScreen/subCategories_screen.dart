import 'package:e_commerce/common_widgets/appbar.dart';
import 'package:e_commerce/common_widgets/title_with_button.dart';
import 'package:e_commerce/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';

import 'horizontal_product_item.dart';

class SubcategoriesScreen extends StatelessWidget {
  const SubcategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        title: Text("Sports Shirts"),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const TRoundedImage(
                  width: double.infinity,
                  height: null,
                  imageUrl: "assets/images/searching.jpg"),
              const SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  TSectionHeading(
                    title: "Sports Sirts",
                    onPress: () {},
                    buttonText: "View All",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 122,
                    child: ListView.separated(
                      separatorBuilder: (context, index) => const SizedBox(
                        width: 9,
                      ),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => HorizontalProductItem(),
                      itemCount: 6,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
