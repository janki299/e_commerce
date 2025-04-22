import 'package:e_commerce/constants/colors.dart';
import 'package:e_commerce/screens/home_screen/Tcircular_container.dart';
import 'package:e_commerce/screens/product_detail_screen/product_review_screen/product_review_screen.dart';
import 'package:e_commerce/services/common_function.dart';
import 'package:e_commerce/theme_widgets/textthem.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = CommonFunction.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.grey,
                  backgroundImage:
                      AssetImage("assets/images/communicating.jpg"),
                ),
                const SizedBox(
                  width: 17,
                ),
                Text(
                  "john doe",
                  style: TTextThem.TTextThemeOnModeBase(context).titleLarge,
                )
              ],
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.menu))
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            TRatingBarIndecator(rating: 4),
            const SizedBox(
              width: 10,
            ),
            Text(
              "01 now 2023",
              style: TTextThem.TTextThemeOnModeBase(context).bodyMedium,
            )
          ],
        ),
        const SizedBox(
          height: 14,
        ),
        const ReadMoreText(
            "hjdshyduiwd dwiuydeioweuyiowq iweuioweiow9euoiw9 euwoueoiw9euw iuioeqwueiowueiowqe qweieuiowquei wqiuwyiquy",
            trimLines: 2,
            moreStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w800,
                color: TColors.primaryColor),
            lessStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w800,
                color: TColors.primaryColor),
            trimMode: TrimMode.Line,
            trimExpandedText: "Show less",
            trimCollapsedText: "show more"),
        const SizedBox(
          height: 10,
        ),
        TRoundedContainer(
          radius: 10,
          backgroundColor: isDark ? Colors.grey.shade300 : Colors.grey,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Text  to text ",
                      style: TTextThem.TTextThemeOnModeBase(context).bodyLarge,
                    ),
                    Text(
                      "10 jan, 2025",
                      style: TTextThem.TTextThemeOnModeBase(context).bodyMedium,
                    ),
                  ],
                ),
                const ReadMoreText(
                    "hjdshyduiwd dwiuydeioweuyiowq iweuioweiow9euoiw9 euwoueoiw9euw iuioeqwueiowueiowqe qweieuiowquei wqiuwyiquy",
                    trimLines: 2,
                    moreStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                        color: TColors.primaryColor),
                    lessStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                        color: TColors.primaryColor),
                    trimMode: TrimMode.Line,
                    trimExpandedText: "Show less",
                    trimCollapsedText: "show more"),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
