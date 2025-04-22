import 'package:flutter/widgets.dart';

import 'TCustomProductContainer.dart';

class productGrid extends StatelessWidget {
  const productGrid({
    super.key,
    // required this.product,
  });
  // final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 4,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          mainAxisExtent: 288,
          crossAxisSpacing: 4),
      itemBuilder: (context, index) {
        return Tcustomproductcontainer(
            // product: product,
            );
      },
    );
  }
}
