import 'package:e_commerce/common_widgets/appbar.dart';
import 'package:flutter/material.dart';

class AllProduct extends StatelessWidget {
  const AllProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TAppBar(
        title: Text("Popular products"),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: TShortableProduct(),
        ),
      ),
    );
  }
}

class TShortableProduct extends StatelessWidget {
  const TShortableProduct({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButtonFormField(
          borderRadius: BorderRadius.circular(8),
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.sort),
          ),
          items: [
            "name",
            "higher price",
            "Lower price",
            "sale",
            "Newest",
            "popularity"
          ].map((e) {
            return DropdownMenuItem(value: e, child: Text(e));
          }).toList(),
          onChanged: (value) {},
        ),
        SizedBox(
          height: 12,
        ),
        // TGridLayout(
        //   itemCount: 4,
        //   mainAxisExtent: 288,
        //   itemBuilder: (p0, p1) => Tcustomproductcontainer(product: null,),
        // )
      ],
    );
  }
}
