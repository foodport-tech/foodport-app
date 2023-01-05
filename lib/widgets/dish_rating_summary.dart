import 'package:flutter/material.dart';

import '../utils/colors.dart';

class DishRatingSummary extends StatelessWidget {
  double? averageRatingDelicious;
  double? averageRatingEatAgain;
  double? averageRatingWorthIt;
  int? totalRating;

  DishRatingSummary({
    Key? key,
    this.averageRatingDelicious,
    this.averageRatingEatAgain,
    this.averageRatingWorthIt,
    this.totalRating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Rating: Taste
        Image.asset(
          'assets/images/icons/star_filled.png',
          width: 16,
          height: 16,
        ),
        SizedBox(width: 4),
        Text(
          averageRatingDelicious.toString(),
          style: TextStyle(
            color: neutral3Color,
            fontFamily: 'OpenSans',
          ),
        ),
        SizedBox(width: 8),

        // Rating: Eat Again
        Image.asset(
          'assets/images/icons/fire_filled.png',
          width: 16,
          height: 16,
        ),
        SizedBox(width: 4),
        Text(
          averageRatingEatAgain.toString(),
          style: TextStyle(
            color: neutral3Color,
            fontFamily: 'OpenSans',
          ),
        ),
        SizedBox(width: 8),

        // Rating: Worth It
        Image.asset(
          'assets/images/icons/coin_filled.png',
          width: 16,
          height: 16,
        ),
        SizedBox(width: 4),
        Text(
          averageRatingWorthIt.toString(),
          style: TextStyle(
            color: neutral3Color,
            fontFamily: 'OpenSans',
          ),
        ),
        SizedBox(width: 8),

        // Amount of Rating
        Text(
          '(${totalRating} Ratings)',
          style: TextStyle(
            color: neutral3Color,
            fontFamily: 'OpenSans',
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
