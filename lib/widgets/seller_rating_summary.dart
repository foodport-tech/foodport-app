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
        // Rating: Worth It
        Icon(
          Icons.star,
          size: 16,
        ),

        SizedBox(width: 4),
        Text(
          averageRatingEnvironment.toString(),
          style: TextStyle(
            color: neutral3Color,
            fontFamily: 'OpenSans',
          ),
        ),
        SizedBox(width: 8),

        // Amount of Ratings
        Text(
          '(${totalRating} Ratings)',
          style: TextStyle(
            color: neutral3Color,
            fontFamily: 'OpenSans',
          ),
        ),
      ],
    );
  }
}
