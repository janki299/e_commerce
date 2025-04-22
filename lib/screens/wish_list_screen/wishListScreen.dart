import 'package:flutter/material.dart';

import '../../common_widgets/appbar.dart';
import '../home_screen/home_screen.dart';

class Wishlistscreen extends StatelessWidget {
  const Wishlistscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text("Wish List"),
        action: [
          CustomIconHolder(
            icon: Icon(Icons.abc),
            count: "1",
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 12,
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

// TGridLayout(
// itemCount: 4,
// mainAxisExtent: 288,
// itemBuilder: (context, index) {
// return Tcustomproductcontainer();
// },
// )
