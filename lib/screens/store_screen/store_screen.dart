import 'package:e_commerce/controller/category_controller.dart';
import 'package:e_commerce/screens/store_screen/storeGridComponent.dart';
import 'package:e_commerce/screens/store_screen/tabViewFullBody.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common_widgets/appbar.dart';
import '../../common_widgets/customGridView.dart';
import '../../common_widgets/custom_searchbar.dart';
import '../../common_widgets/title_with_button.dart';
import '../../constants/colors.dart';
import '../../services/common_function.dart';
import '../../theme_widgets/textthem.dart';
import '../all_brand_screen/all_brand_screen.dart';
import '../home_screen/home_screen.dart';

class StoreScreen extends StatefulWidget {
  const StoreScreen({super.key});

  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  @override
  Widget build(BuildContext context) {
    final categories = CategoryController.instance.featuredCategories;
    final isDark = CommonFunction.isDarkMode(context);
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: TAppBar(
          title: Text("Store"),
          action: [
            CustomIconHolder(
              icon: Icon(Icons.abc),
              count: "1",
              onPressed: () {},
            )
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: CommonFunction.isDarkMode(context)
                    ? Colors.black
                    : Colors.white,
                expandedHeight: 379,
                flexibleSpace: Padding(
                  padding: EdgeInsets.all(8),
                  child: ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      Container(
                        child: Text("featureded post"),
                      ),
                      const CustomSearchBar(
                        text: "search here",
                        showBorder: true,
                        showBackGroundColor: false,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TSectionHeading(
                        title: "Featured Brand",
                        showActionButton: true,
                        buttonText: "View",
                        onPress: () {
                          Get.to(() => AllBrandScreen());
                        },
                      ),
                      TGridLayout(
                        itemCount: 4,
                        mainAxisExtent: 80,
                        itemBuilder: (context, index) {
                          return const Storegridcomponent();
                        },
                      ),
                    ],
                  ),
                ),
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(50),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    color: CommonFunction.isDarkMode(context)
                        ? Colors.black
                        : Colors.white,
                    child: TabBar(
                        tabAlignment: TabAlignment.start,
                        isScrollable: true,
                        indicatorColor: TColors.primaryColor,
                        labelColor:
                            isDark ? Colors.white : TColors.primaryColor,
                        tabs: categories
                            .map((categories) =>
                                Tab(child: Text(categories.name)))
                            .toList()),
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
              children: categories
                  .map(
                    (category) => Tabviewfullbody(
                      category: category,
                    ),
                  )
                  .toList()),
          // [Tabviewfullbody()]),
        ),
      ),
    );
  }
}

class TextwithIcon extends StatelessWidget {
  const TextwithIcon({
    super.key,
    this.text,
  });
  final String? text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text ?? "",
          style: TTextThem.TTextThemeOnModeBase(context).bodyLarge,
          maxLines: 1,
        ),
        const SizedBox(
          width: 6,
        ),
        const Icon(
          Icons.verified,
          color: Colors.blue,
          size: 16,
        )
      ],
    );
  }
}
