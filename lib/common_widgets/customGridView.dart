import 'package:flutter/widgets.dart';

class TGridLayout extends StatelessWidget {
  const TGridLayout(
      {super.key,
      required this.itemCount,
      this.mainAxisExtent,
      required this.itemBuilder});

  final int itemCount;
  final double? mainAxisExtent;
  final Widget? Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: itemCount,
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: mainAxisExtent,
            mainAxisSpacing: 16.0,
            crossAxisSpacing: 16.0),
        itemBuilder: itemBuilder);
  }
}
