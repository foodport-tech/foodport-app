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
      height: 240,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.35,
          crossAxisSpacing: 0,
          mainAxisSpacing: 0,
        ),
        padding: EdgeInsets.only(
          left: 24,
          right: 24,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: dishes.length,
        itemBuilder: (context, index) => ChangeNotifierProvider.value(
          value: dishes[index],
          // Trending Card
          child: Container(
            margin: EdgeInsets.only(
              top: 0,
              bottom: 16,
              left: 8,
              right: 8,
            ),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(8.0),
              ),
              boxShadow: [
                BoxShadow(
                  color: neutral5Color,
                  spreadRadius: 0,
                  blurRadius: 16,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              children: [
                // Image Section
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8.0),
                    bottomLeft: Radius.circular(8.0),
                  ),
                  child: Image.network(
                    'https://media.istockphoto.com/id/1309352410/photo/cheeseburger-with-tomato-and-lettuce-on-wooden-board.jpg?s=612x612&w=0&k=20&c=lfsA0dHDMQdam2M1yvva0_RXfjAyp4gyLtx4YUJmXgg=',
                    height: 104,
                    width: 104,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 16),

                // Ranking Indicator
                Icon(
                  Icons.circle,
                  size: 8,
                ),
                SizedBox(width: 4),

                // Ranking Number
                Text(
                  '1',
                  style: TextStyle(
                    color: neutral1Color,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    fontFamily: 'OpenSans',
                  ),
                ),
                SizedBox(width: 12),

                // Dish Detail Section
                Expanded(
                  child: Container(
                    height: 200,
                    alignment: Alignment.topLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 12),
                        // Dish Name
                        Text(
                          dishes[index].dishName!,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: neutral1Color,
                            fontFamily: 'OpenSans',
                          ),
                        ),
                        SizedBox(height: 8),

                        // Rating
                        DishRating(
                          dishRatingDelicious: 5.0,
                          dishRatingEatAgain: 4.9,
                          dishRatingWorthIt: 4.8,
                          showTotalRating: false,
                          totalRating: 123,
                        ),
                        SizedBox(height: 8),

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
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: primaryColor,
                                fontFamily: 'OpenSans',
                              ),
                            ),
                            SizedBox(width: 16),
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
