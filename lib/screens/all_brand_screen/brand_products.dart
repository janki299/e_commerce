import 'package:e_commerce/common_widgets/appbar.dart';
import 'package:e_commerce/screens/store_screen/storeGridComponent.dart';
import 'package:flutter/material.dart';

import '../all_product/all_product.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text("Nike"),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              Storegridcomponent(),
              SizedBox(
                height: 20,
              ),
              TShortableProduct(),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
