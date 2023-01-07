import 'package:flutter/material.dart';
import 'package:foodport_app/widgets/dish_rating.dart';
import 'package:provider/provider.dart';

import '../../providers/dish.dart';
import '../../utils/colors.dart';

class NearbyDishCard extends StatelessWidget {
  const NearbyDishCard({
    Key? key,
    required this.dishes,
  }) : super(key: key);

  final List<Dish> dishes;

  @override
  Widget build(BuildContext context) {
    return Container(
      // Cannot remove height
      height: 320,
      child: ListView.builder(
        padding: EdgeInsets.only(
          left: 24,
          right: 24,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: dishes.length,
        itemBuilder: (context, index) => ChangeNotifierProvider.value(
          value: dishes[index],
          child: Container(
            margin: EdgeInsets.only(
              top: 16,
              bottom: 22,
              left: 8,
              right: 8,
            ),
            width: 160,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              boxShadow: [
                BoxShadow(
                  color: neutral5Color,
                  spreadRadius: 0,
                  blurRadius: 16,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              children: [
                // Image
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8.0),
                    topRight: Radius.circular(8.0),
                  ),
                  child: Image.network(
                    'https://media.istockphoto.com/id/1309352410/photo/cheeseburger-with-tomato-and-lettuce-on-wooden-board.jpg?s=612x612&w=0&k=20&c=lfsA0dHDMQdam2M1yvva0_RXfjAyp4gyLtx4YUJmXgg=',
                    width: 160,
                    height: 160,
                    fit: BoxFit.cover,
                  ),
                ),
                // Bottom Section
                Container(
                  height: 122,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 12.0,
                      left: 12.0,
                      right: 12.0,
                      bottom: 12.0,
                    ),
                    child: Column(
                      children: [
                        // Dish Name
                        Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            dishes[index].dishName!,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: neutral1Color,
                              fontFamily: 'OpenSans',
                            ),
                          ),
                        ),
                        SizedBox(height: 4),

                        // Rating
                        Container(
                          alignment: Alignment.topLeft,
                          child: DishRating(
                            dishRatingDelicious: 5.0,
                            dishRatingEatAgain: 4.9,
                            dishRatingWorthIt: 4.8,
                            showTotalRating: false,
                            totalRating: 123,
                          ),
                        ),
                        Expanded(child: Container()),
                        // SizedBox(height: 6),

                        // Price
                        Container(
                          child: Row(
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
                            ],
                          ),
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
