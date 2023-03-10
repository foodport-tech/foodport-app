import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/dish.dart';
import '../../providers/dishes.dart';
import '../../providers/post.dart';
import '../../providers/seller.dart';
import '../../providers/sellers.dart';
import '../../providers/user.dart';
import '../../providers/users.dart';
import '../../utils/colors.dart';
import '../like_animation.dart';
import 'post_card_bottom_content.dart';

class PostCard extends StatefulWidget {
  PostCard({
    super.key,
  });

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  bool isLikeAnimating = false;

  int commentLen = 0;

  @override
  Widget build(BuildContext context) {
    print("//post_card.dart - Widget build");

    Post post = Provider.of<Post>(context, listen: false);
    print("//post_card.dart - post.userId: ${post.userId}");

    // TODO: Update backend of class Users
    Users usersData = Provider.of<Users>(context, listen: false);
    Future<User> user =
        usersData.fetchSingleUserFromBackend(userId: post.userId);

    print("//post_card.dart - user: $user");

    // TODO: Update backend of class Dishes
    // Dish dish = Dishes().findByDishId(post.dishId!);

    // TODO: Update backend of class Sellers
    // Seller seller = Sellers().findBySellerId(dish.sellerId!);

    // return Padding(
    //   padding: const EdgeInsets.only(
    //     top: 16.0,
    //     bottom: 32.0,
    //     left: 32.0,
    //     right: 32.0,
    //   ),
    //   // White Background
    //   child: Container(
    //     decoration: BoxDecoration(
    //       color: Theme.of(context).scaffoldBackgroundColor,
    //       borderRadius: BorderRadius.all(Radius.circular(16)),
    //       boxShadow: [
    //         BoxShadow(
    //           color: neutral5Color,
    //           spreadRadius: 0,
    //           blurRadius: 24,
    //           offset: Offset(0, 8),
    //         ),
    //       ],
    //     ),
    //     child: Column(
    //       children: [
    //         Text(post.postId.toString()),
    //         Text(post.postPublishDateTime.toString()),
    //         Text(post.postPhotoUrl!),
    //         Text(post.postReview),
    //         Text(post.postRatingDelicious.toString()),
    //         Text(post.postRatingEatAgain.toString()),
    //         Text(post.postRatingWorthIt.toString()),
    //         Text(post.userId.toString()),
    //         Text(post.dishId.toString()),
    //         Text(post.postView),
    //         Image.network(post.postPhotoUrl!),
    //         Image.network(
    //             "https://animalcrossingworld.com/wp-content/uploads/2021/11/animal-crossing-new-horizons-guide-recipe-item-aji-fry-craft-icon.png"),
    //       ],
    //     ),
    //   ),
    // );

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
              blurRadius: 24,
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
                alignment: Alignment.bottomCenter,
                children: [
                  // Post Photo
                  Container(
                    height: MediaQuery.of(context).size.width - 32 - 32,
                    width: MediaQuery.of(context).size.width - 32 - 32,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16.0),
                        topRight: Radius.circular(16.0),
                      ),
                      child: Image.network(
                        // "https://animalcrossingworld.com/wp-content/uploads/2021/11/animal-crossing-new-horizons-guide-recipe-item-aji-fry-craft-icon.png",
                        post.postPhotoUrl!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  // Post's Menu Location & Author's Profile Picture
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Post's Menu Location
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 16.0,
                          bottom: 8.0,
                        ),
                        child: Container(
                          padding: EdgeInsets.only(
                              top: 4, bottom: 4, left: 4, right: 6),
                          decoration: BoxDecoration(
                            color: Colors.black45,
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // Location Icon
                              Image.asset(
                                'assets/images/icons/location_pin.png',
                                height: 14,
                                width: 14,
                              ),
                              SizedBox(width: 4),

                              // Location Name
                              Text(
                                "city", //seller.sellerOperatingLocation['city'],
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // Post Author's Profile Picture
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 16.0,
                          bottom: 8.0,
                        ),
                        child: Container(
                          height: 26,
                          width: 26,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 2,
                              color: neutral6Color,
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          // User's Profile Picture
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(14.0),
                            child: Container(
                              child: Image.network(
                                "https://privacysymposium.org/wp-content/uploads/2023/02/9abb2ff1274b030d9cd9d5e73c2e4dda.jpg", // user.userProfilePictureURL,
                                height: 24,
                                width: 24,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
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
            PostCardBottomContent(post: post),
          ],
        ),
      ),
    );
  }
}
