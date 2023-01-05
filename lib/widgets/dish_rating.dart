import 'package:flutter/material.dart';

import '../utils/colors.dart';

class DishRating extends StatelessWidget {
  double dishRatingDelicious;
  double dishRatingEatAgain;
  double dishRatingWorthIt;
  int? totalRating;
  bool showTotalRating = true;

  DishRating({
    Key? key,
    required this.dishRatingDelicious,
    required this.dishRatingEatAgain,
    required this.dishRatingWorthIt,
    required this.showTotalRating,
    this.totalRating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Rating: Taste
        Image.asset(
          'assets/images/icons/star_filled.png',
          width: 14,
          height: 14,
        ),
        SizedBox(width: 4),
        Text(
          totalRating == null
              // User's Rating (int)
              ? dishRatingDelicious.toStringAsFixed(0)
              // Users' Average Rating (double)
              : dishRatingDelicious.toString(),
          style: TextStyle(
            fontSize: 16,
            color: neutral3Color,
            fontFamily: 'OpenSans',
          ),
        ),
        SizedBox(width: 6),

        // Rating: Eat Again
        Image.asset(
          'assets/images/icons/fire_filled.png',
          width: 14,
          height: 14,
        ),
        SizedBox(width: 4),
        Text(
          totalRating == null
              ? dishRatingEatAgain.toStringAsFixed(0)
              : dishRatingEatAgain.toString(),
          style: TextStyle(
            fontSize: 16,
            color: neutral3Color,
            fontFamily: 'OpenSans',
          ),
        ),
        SizedBox(width: 6),

        // Rating: Worth It
        Image.asset(
          'assets/images/icons/coin_filled.png',
          width: 14,
          height: 14,
        ),
        SizedBox(width: 4),
        Text(
          totalRating == null
              ? dishRatingWorthIt.toStringAsFixed(0)
              : dishRatingWorthIt.toString(),
          style: TextStyle(
            fontSize: 16,
            color: neutral3Color,
            fontFamily: 'OpenSans',
          ),
        ),

        // Amount of Rating
        showTotalRating == true
            ? Text(
                totalRating == null ? "" : "  (${totalRating} Ratings)",
                style: TextStyle(
                  color: neutral3Color,
                  fontFamily: 'OpenSans',
                  fontSize: 12,
                ),
              )
            : Text(""),
      ],
    );
  }
}
