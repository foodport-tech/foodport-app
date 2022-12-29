import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/post.dart';
import '../../utils/colors.dart';
import '../like_animation.dart';
import 'post_card_side_bar.dart';

class PostCard extends StatefulWidget {
  // TEST Listener posts[index]
  // final String postId;
  // final String postPhotoUrl;
  // final DateTime postPublishDateTime;
  // final double postRatingRecommend;
  // final double postRatingStar;
  // final double postRatingWorthIt;
  // final String postReview;
  // final String userId;
  // String? dishId;

  PostCard({
    super.key,
    //   required this.postId,
    //   required this.postPhotoUrl,
    //   required this.postPublishDateTime,
    //   required this.postRatingRecommend,
    //   required this.postRatingStar,
    //   required this.postRatingWorthIt,
    //   required this.postReview,
    //   required this.userId,
    //   this.dishId,
  });

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  bool isLikeAnimating = false;
  int commentLen = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final post = Provider.of<Post>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.only(
        top: 16.0,
        bottom: 32.0,
        left: 32.0,
        right: 32.0,
      ),
      // White Background
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(16)),
          boxShadow: [
            BoxShadow(
              color: neutral5Color,
              spreadRadius: 0,
              blurRadius: 28,
              offset: Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          children: [
            // IMAGE SECTION
            GestureDetector(
              onDoubleTap: () {
                setState(() {
                  isLikeAnimating = true;
                });
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.35,
                    width: double.infinity,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(16.0),
                          topRight: Radius.circular(16.0)),
                      child: Image.network(
                        post.postPhotoUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // AnimatedOpacity(
                  //   duration: const Duration(milliseconds: 200),
                  //   opacity: isLikeAnimating ? 1 : 0,
                  //   child: LikeAnimation(
                  //     isAnimating: isLikeAnimating,
                  //     duration: const Duration(milliseconds: 400),
                  //     onEnd: () {
                  //       setState(() {
                  //         isLikeAnimating = false;
                  //       });
                  //     },
                  //     child: const Icon(
                  //       Icons.favorite,
                  //       color: red2Color,
                  //       size: 100,
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),

            //Expanded
            Expanded(
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
                            Container(
                              child: Row(
                                children: [
                                  // Rating - Star
                                  const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    post.postRatingStar.toString(),
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  const Icon(
                                    Icons.recommend,
                                    color: red1Color,
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    post.postRatingRecommend.toString(),
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  const Icon(
                                    Icons.monetization_on,
                                    color: Color.fromRGBO(199, 178, 115, 1),
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    post.postRatingWorthIt.toString(),
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
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
            ),
          ],
        ),
      ),
    );
  }
}
