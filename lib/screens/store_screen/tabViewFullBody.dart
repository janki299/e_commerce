import 'package:e_commerce/common_widgets/title_with_button.dart';
import 'package:e_commerce/model/category_model.dart';
import 'package:flutter/widgets.dart';

import 'bodyProduct.dart';

class Tabviewfullbody extends StatefulWidget {
  const Tabviewfullbody({super.key, required this.category});
  final CategoryModel category;
  @override
  State<Tabviewfullbody> createState() => _TabviewfullbodyState();
}

class _TabviewfullbodyState extends State<Tabviewfullbody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: SingleChildScrollView(
        child: Column(
          children: [
            BodyOfTapBarView(
              image: [
                "assets/images/searching.jpg",
                "assets/images/searching.jpg",
                "assets/images/searching.jpg"
              ],
            ),
            TSectionHeading(
              title: "You might like",
              showActionButton: true,
              onPress: () {},
              buttonText: "View all",
            ),
            // TGridLayout(
            //   itemCount: 4,
            //   mainAxisExtent: 288,
            //   itemBuilder: (context, index) {
            //     return Tcustomproductcontainer();
            //   },
            // )
          ],
        ),
      ),
    );
  }
}
