import 'package:flutter/material.dart';
import 'package:foodport_app/widgets/like_animation.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../models/user.dart' as model;
import '../providers/user_provider.dart';
import '../utils/colors.dart';

class PostCard extends StatefulWidget {
  final snap;
  const PostCard({super.key, this.snap});

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  bool isLikeAnimating = false;

  @override
  Widget build(BuildContext context) {
    final model.User user = Provider.of<UserProvider>(context).getUser;

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
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16.0),
                          topRight: Radius.circular(16.0)),
                      child: Image.network(
                        widget.snap['photoUrl'],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 200),
                    opacity: isLikeAnimating ? 1 : 0,
                    child: LikeAnimation(
                      child: const Icon(
                        Icons.favorite,
                        color: red2Color,
                        size: 100,
                      ),
                      isAnimating: isLikeAnimating,
                      duration: const Duration(milliseconds: 400),
                      onEnd: () {
                        setState(() {
                          isLikeAnimating = false;
                        });
                      },
                    ),
                  ),
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
                    SizedBox(
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
                                Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  widget.snap['ratingValueDelicious']
                                      .round()
                                      .toString(),
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Icon(
                                  Icons.recommend,
                                  color: red1Color,
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  widget.snap['ratingValueRecommend']
                                      .round()
                                      .toString(),
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Icon(
                                  Icons.monetization_on,
                                  color: Color.fromRGBO(199, 178, 115, 1),
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  widget.snap['ratingValueWorthIt']
                                      .round()
                                      .toString(),
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            )),
                            const SizedBox(
                              height: 12,
                            ),
                            // Username Section
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                widget.snap['username'],
                                style: TextStyle(
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
                              child: Text(widget.snap['review']),
                            ),
                            const SizedBox(
                              height: 16,
                            ),

                            // Ingredients Section
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Ingredients",
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                  "bread, egg, ham, patty, cheese, mayonaise, blackpepper"),
                            ),
                            const SizedBox(
                              height: 16,
                            ),

                            // Nutritions Section
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Nutritions",
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                  "NutritionsNutritionsNutritionsNutritions"),
                            ),

                            Expanded(
                              child: Container(
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  // DateFormat import from package 'intl'
                                  DateFormat(
                                    'dd MMMM yyyy · hh:mm aa',
                                  ).format(
                                    widget.snap['datePublished'].toDate(),
                                  ),
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),

                    // Like, Comment, Share Section
                    Container(
                      alignment: Alignment.topCenter,
                      child: Column(
                        children: [
                          // Food Menu Section
                          Icon(
                            Icons.menu_book_outlined,
                            size: 24,
                          ),
                          Text("6793"),
                          const SizedBox(height: 16),

                          // Like Section
                          LikeAnimation(
                            isAnimating:
                                widget.snap['likes'].contains(user.uid),
                            smallLike: true,
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.favorite,
                                size: 24,
                                color: red2Color,
                              ),
                            ),
                          ),

                          Text("18.5k"),
                          const SizedBox(height: 16),

                          // Comment Section
                          Icon(
                            Icons.comment_outlined,
                            size: 24,
                          ),
                          Text("1774"),
                          const SizedBox(height: 16),

                          // Save Post Section
                          Icon(
                            Icons.bookmark_outline,
                            size: 24,
                          ),
                          Text("7093"),
                          const SizedBox(height: 16),

                          // Share Post Section
                          Icon(
                            Icons.share_outlined,
                            size: 24,
                          ),
                          Text("5604"),
                        ],
                      ),
                    ),
                    SizedBox(
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
