import 'package:flutter/material.dart';

import '../utils/colors.dart';

class SellerRatingSummary extends StatelessWidget {
  double? averageRatingEnvironment;
  int? totalRating;

  SellerRatingSummary({
    Key? key,
    this.averageRatingEnvironment,
    this.totalRating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Rating: Environment
        Image.asset(
          'assets/images/icons/fire_filled.png',
          width: 14,
          height: 14,
        ),

        SizedBox(width: 4),
        Text(
          averageRatingEnvironment.toString(),
          style: TextStyle(
            fontFamily: 'OpenSans',
            color: neutral3Color,
          ),
        ),
        SizedBox(width: 8),

        // Amount of Ratings
        Text(
          '(${totalRating} Posts)',
          style: TextStyle(
            fontFamily: 'OpenSans',
            color: neutral3Color,
          ),
        ),
      ],
    );
  }
}
