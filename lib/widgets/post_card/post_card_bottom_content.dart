import 'package:flutter/material.dart';
import 'package:foodport_app/providers/dishes.dart';
import 'package:foodport_app/widgets/dish_rating.dart';
import 'package:intl/intl.dart';

import '../../providers/dish.dart';
import '../../providers/post.dart';
import '../../providers/seller.dart';
import '../../providers/sellers.dart';
import '../../providers/user.dart';
import '../../providers/users.dart';
import '../../utils/colors.dart';
import 'post_card_side_bar.dart';

class PostCardBottomContent extends StatelessWidget {
  const PostCardBottomContent({
    Key? key,
    required this.post,
  }) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    // TODO: Update backend of class Users
    // User user = Users().findByUserId(post.userId);
    // TODO: Update backend of class Dishes
    // Dish dish = Dishes().findByDishId(post.dishId!);
    // TODO: Update backend of class Sellers
    // Seller seller = Sellers().findBySellerId(dish.sellerId!);

    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 16,
        ).copyWith(right: 0),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
        ),
        child: Row(
          children: [
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Container(
                alignment: Alignment.topLeft,
                child: Column(
                  children: [
                    // Rating Section
                    DishRating(
                      dishRatingDelicious: post.postRatingDelicious,
                      dishRatingEatAgain: post.postRatingEatAgain,
                      dishRatingWorthIt: post.postRatingWorthIt,
                      showTotalRating: false,
                    ),

                    const SizedBox(
                      height: 12,
                    ),
                    // Username Section
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "user.userUsername!", //user.userUsername!, // Find username from userId
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: neutral1Color,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),

                    // Review Section
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "dish.dishName - post.postReview", //"${dish.dishName} - ${post.postReview}",
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: neutral1Color,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),

                    // Ingredients Section
                    Container(
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        "Ingredients",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: neutral1Color,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        // If got dishMainIngredient, show dishMainIngredient.
                        // Else show dishIngredient
                        "dish.dishMainIngredient ?? dish.dishIngredient", //dish.dishMainIngredient ?? dish.dishIngredient,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: neutral1Color,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),

                    // Nutritions Section
                    Container(
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        "Nutritions",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: neutral1Color,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "dish.dishNutrition", // dish.dishNutrition,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: neutral1Color,
                        ),
                      ),
                    ),

                    Expanded(
                      child: Container(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          // 'dd MMMM yyyy · hh:mm aa',
                          DateFormat("dd MMM yyyy · hh:mm aa")
                              .format(post.postPublishDateTime)
                              .toString(),
                          style: const TextStyle(
                            fontSize: 12,
                            color: neutral3Color,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 16,
            ),

            // Like, Comment, Share Section
            PostCardSideBar(post: post),
            const SizedBox(
              width: 16,
            ),
          ],
        ),
      ),
    );
  }
}
