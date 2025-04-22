import 'package:e_commerce/common_widgets/appbar.dart';
import 'package:e_commerce/constants/colors.dart';
import 'package:e_commerce/screens/product_detail_screen/product_review_screen/user_review_card.dart';
import 'package:e_commerce/services/layout.dart';
import 'package:e_commerce/theme_widgets/textthem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductReviewScreen extends StatelessWidget {
  const ProductReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text("Reviews & Rating"),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  "Rating and reviewRating and reviewRating and reviewRating and reviewRating and reviewRating and reviewRating and reviewRating and reviewRating and reviewRating and review."),
              SizedBox(
                height: 10,
              ),
              TOverALlProductRatingWidget(),
              const TRatingBarIndecator(
                rating: 3.5,
              ),
              Text(
                "12.321",
                style: TTextThem.TTextThemeOnModeBase(context).bodySmall,
              ),
              const SizedBox(
                height: 10,
              ),
              UserReviewCard(),
              UserReviewCard(),
              UserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}

class TRatingBarIndecator extends StatelessWidget {
  const TRatingBarIndecator({
    super.key,
    required this.rating,
  });
  final double rating;

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      rating: rating,
      itemSize: 20,
      unratedColor: Colors.grey.shade600,
      itemBuilder: (context, index) => Icon(
        Icons.star,
        color: TColors.primaryColor,
      ),
    );
  }
}

class TOverALlProductRatingWidget extends StatelessWidget {
  const TOverALlProductRatingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Text(
            "4.8",
            style: TTextThem.TTextThemeOnModeBase(context).displayLarge,
          ),
        ),
        Expanded(
          flex: 7,
          child: Column(
            children: [
              TRatingProgressIndecator(
                text: '5',
                value: 1.0,
              ),
              TRatingProgressIndecator(
                text: '4',
                value: 0.8,
              ),
              TRatingProgressIndecator(
                text: '3',
                value: 0.6,
              ),
              TRatingProgressIndecator(
                text: '2',
                value: 0.4,
              ),
              TRatingProgressIndecator(
                text: '1',
                value: 0.2,
              ),
            ],
          ),
        )
      ],
    );
  }
}

class TRatingProgressIndecator extends StatelessWidget {
  const TRatingProgressIndecator({
    super.key,
    required this.text,
    required this.value,
  });
  final String text;
  final double value;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(
            text,
            style: TTextThem.TTextThemeOnModeBase(context).bodyMedium,
          ),
        ),
        // SizedBox(
        //   width: 12,
        // ),
        Expanded(
          flex: 11,
          child: SizedBox(
            width: Layout.width(context) * 0.08,
            child: LinearProgressIndicator(
              value: value,
              minHeight: 11,
              backgroundColor: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(8),
              valueColor: AlwaysStoppedAnimation(TColors.primaryColor),
            ),
          ),
        )
      ],
    );
  }
}
