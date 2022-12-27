import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:foodport_app/screens/comments_screen.dart';
import 'package:foodport_app/screens/dish_detail_screen.dart';
import 'package:foodport_app/utils/utils.dart';
import 'package:foodport_app/widgets/like_animation.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../models/user_ig.dart' as model;
import '../providers/user_provider_ig.dart';
import '../resources/firestore_methods.dart';
import '../utils/colors.dart';

class PostCard extends StatefulWidget {
  //final snap;
  const PostCard({super.key});

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  bool isLikeAnimating = false;
  int commentLen = 0;

  @override
  void initState() {
    super.initState();
    // TOFIX: Firebase
    // getComments();
  }

  // TOFIX: Firebase
  // void getComments() async {
  //   try {
  //     QuerySnapshot snap = await FirebaseFirestore.instance
  //         .collection('posts')
  //         .doc(widget.snap['postId'])
  //         .collection('comments')
  //         .get();

  //     commentLen = snap.docs.length;
  //   } catch (e) {
  //     showSnackBar(e.toString(), context);
  //   }

  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    // TOFIX: Data Model
    // final model.User user = Provider.of<UserProvider>(context).getUser;

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
              onDoubleTap: () async {
                // TOFIX: Firebase
                // await FirestoreMethods().doubleTapLikePost(
                //   widget.snap['postId'],
                //   user.uid,
                //   widget.snap['likes'],
                // );
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
                        'https://media.istockphoto.com/id/1309352410/photo/cheeseburger-with-tomato-and-lettuce-on-wooden-board.jpg?s=612x612&w=0&k=20&c=lfsA0dHDMQdam2M1yvva0_RXfjAyp4gyLtx4YUJmXgg=',
                        // TOFIX: Firebase
                        // widget.snap['photoUrl'],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 200),
                    opacity: isLikeAnimating ? 1 : 0,
                    child: LikeAnimation(
                      isAnimating: isLikeAnimating,
                      duration: const Duration(milliseconds: 400),
                      onEnd: () {
                        setState(() {
                          isLikeAnimating = false;
                        });
                      },
                      child: const Icon(
                        Icons.favorite,
                        color: red2Color,
                        size: 100,
                      ),
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
                                  '3',
                                  // TOFIX: Firebase
                                  // widget.snap['ratingValueDelicious']
                                  //     .round()
                                  //     .toString(),
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
                                  '4',
                                  // TOFIX: Firebase
                                  // widget.snap['ratingValueRecommend']
                                  //     .round()
                                  //     .toString(),
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
                                  '5',
                                  // TOFIX: Firebase
                                  // widget.snap['ratingValueWorthIt']
                                  //     .round()
                                  //     .toString(),
                                  style: const TextStyle(
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
                                'username',
                                // TOFIX: Firebase
                                // widget.snap['username'],
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
                                "review, a sentence of review..",
                              ),
                              // TOFIX: Firebase
                              //child: Text(widget.snap['review']),
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
                                  "calories-266g, fat-10g, sodium-396mg, carbohydrates-30g, fiber-1g, sugars-5g, protein-13g"),
                            ),

                            Expanded(
                              child: Container(
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  'dd MMMM yyyy · hh:mm aa',
                                  // TOFIX: Firebase
                                  // DateFormat import from package 'intl'
                                  // DateFormat(
                                  //   'dd MMMM yyyy · hh:mm aa',
                                  // ).format(
                                  //   widget.snap['datePublished'].toDate(),
                                  // ),
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
                    Container(
                      alignment: Alignment.topCenter,
                      child: Column(
                        children: [
                          // Food Menu Section
                          // TODO: If post tagged dish, then only show this
                          IconButton(
                            icon: const Icon(
                              Icons.menu_book_outlined,
                              size: 24,
                            ),
                            onPressed: () {
                              // Better method
                              Navigator.of(context).pushNamed(
                                DishDetailScreen.routeName,
                                // arguments: dishId,
                              );
                              // Not a good method:
                              // Navigator.of(context).push(
                              //   MaterialPageRoute(
                              //     builder: (ctx) => DishDetailScreen(),
                              //   ),
                              // );
                            },
                          ),
                          const Text("6793"),
                          const SizedBox(height: 16),

                          // Like Section
                          LikeAnimation(
                            isAnimating: true, // Temp
                            // TOFIX: Firebase
                            // isAnimating:
                            //     widget.snap['likes'].contains(user.uid),
                            smallLike: true,
                            child: IconButton(
                              onPressed: () {},
                              // onPressed: () async {
                              //   await FirestoreMethods().likePost(
                              //     widget.snap['postId'],
                              //     user.uid,
                              //     widget.snap['likes'],
                              //   );
                              // },
                              // icon: widget.snap['likes'].contains(user.uid)
                              //     ? const Icon(
                              //         Icons.favorite,
                              //         size: 24,
                              //         color: red2Color,
                              //       )
                              //     : const Icon(
                              //         Icons.favorite_border,
                              //       ),
                              icon: const Icon(
                                // Temp
                                Icons.favorite,
                                size: 24,
                                color: red2Color,
                              ),
                            ),
                          ),

                          // Display amount of likes
                          Text('123'), // Temp
                          // TOFIX: Firebase
                          // Text("${widget.snap['likes'].length}"),
                          const SizedBox(height: 16),

                          // Comment Section
                          IconButton(
                            onPressed: () {},
                            // TOFIX: Firebase
                            // onPressed: () => Navigator.of(context).push(
                            //   MaterialPageRoute(
                            //     builder: (context) => CommentsScreen(
                            //       postId: widget.snap['postId'].toString(),
                            //     ),
                            //   ),
                            // ),
                            icon: const Icon(
                              Icons.comment_outlined,
                              size: 24,
                            ),
                          ),
                          Text('12'), // Temp
                          // TOFIX: Firebase
                          // Text("$commentLen"),
                          const SizedBox(height: 16),

                          // Save Post Section
                          const Icon(
                            Icons.bookmark_outline,
                            size: 24,
                          ),
                          const Text("7093"),
                          const SizedBox(height: 16),

                          // Share Post Section
                          const Icon(
                            Icons.share_outlined,
                            size: 24,
                          ),
                          const Text("5604"),
                        ],
                      ),
                    ),
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
