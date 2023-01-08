import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/dish.dart';
import '../../utils/colors.dart';
import '../dish_rating.dart';

class TrendingDishCard extends StatelessWidget {
  const TrendingDishCard({
    Key? key,
    required this.dishes,
  }) : super(key: key);

  final List<Dish> dishes;

  @override
  Widget build(BuildContext context) {
    return Container(
      // Cannot remove height
      height: 296,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.4,
          crossAxisSpacing: 0,
          mainAxisSpacing: 0,
        ),
        padding: EdgeInsets.only(
          top: 8,
          left: 24,
          right: 24,
          bottom: 8,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: dishes.length,
        itemBuilder: (context, index) => ChangeNotifierProvider.value(
          value: dishes[index],
          // Trending Card
          child: Container(
            margin: EdgeInsets.only(
              top: 8,
              bottom: 8,
              left: 8,
              right: 8,
            ),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(16.0),
              ),
              boxShadow: [
                BoxShadow(
                  color: neutral5Color,
                  spreadRadius: 0,
                  blurRadius: 12,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              children: [
                // Image Section
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    bottomLeft: Radius.circular(16.0),
                  ),
                  child: Image.network(
                    'https://media.istockphoto.com/id/1309352410/photo/cheeseburger-with-tomato-and-lettuce-on-wooden-board.jpg?s=612x612&w=0&k=20&c=lfsA0dHDMQdam2M1yvva0_RXfjAyp4gyLtx4YUJmXgg=',
                    height: 124,
                    width: 124,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 12),

                // Ranking Indicator
                Image.asset(
                  'assets/images/icons/triangle_up_filled.png',
                  width: 8,
                  height: 8,
                ),
                SizedBox(width: 4),

                // Ranking Number
                Text(
                  '1',
                  style: TextStyle(
                    color: neutral1Color,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    fontFamily: 'OpenSans',
                  ),
                ),
                SizedBox(width: 12),

                // Dish Detail Section
                Expanded(
                  child: Container(
                    height: 200,
                    padding: EdgeInsets.only(
                      top: 12,
                      bottom: 12,
                      right: 12,
                    ),
                    alignment: Alignment.topLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Dish Name
                        Text(
                          dishes[index].dishName!,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: neutral1Color,
                            fontFamily: 'OpenSans',
                          ),
                        ),
                        SizedBox(height: 4),

                        // Rating
                        DishRating(
                          dishRatingDelicious: 5.0,
                          dishRatingEatAgain: 4.9,
                          dishRatingWorthIt: 4.8,
                          showTotalRating: false,
                          totalRating: 123,
                        ),
                        Expanded(child: Container()),

                        // Price
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'RM',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: neutral2Color,
                                fontFamily: 'OpenSans',
                              ),
                            ),
                            SizedBox(width: 4),
                            Text(
                              dishes[index].dishPrice!.toStringAsFixed(2),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: primaryColor,
                                fontFamily: 'OpenSans',
                              ),
                            ),
                            SizedBox(width: 4),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
