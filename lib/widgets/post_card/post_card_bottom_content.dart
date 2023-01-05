import 'package:flutter/material.dart';
import 'package:foodport_app/widgets/dish_rating.dart';

import '../../providers/post.dart';
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
                        post.userId, // Find username from userId
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
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
                        post.postReview,
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
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: const Text(
                          "bread, egg, ham, patty, cheese, mayonaise, blackpepper"),
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
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        "calories-266g, fat-10g, sodium-396mg, carbohydrates-30g, fiber-1g, sugars-5g, protein-13g",
                      ),
                    ),

                    Expanded(
                      child: Container(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          'dd MMMM yyyy · hh:mm aa',
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
