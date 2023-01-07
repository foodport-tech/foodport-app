import 'package:flutter/material.dart';
import 'package:foodport_app/providers/dish.dart';
import 'package:foodport_app/screens/seller_profile_screen.dart';
import 'package:provider/provider.dart';

import '../providers/dishes.dart';
import '../providers/posts.dart';
import '../utils/colors.dart';
import '../widgets/dish_rating.dart';
import '../widgets/seller_rating_summary.dart';

class DishDetailScreen extends StatelessWidget {
  const DishDetailScreen({super.key});
  static const routeName = '/dish_detail';

  @override
  Widget build(BuildContext context) {
    // Get dishId
    // Data pass from Navigator(arguments:) of 'post_card.dart'
    final postId = ModalRoute.of(context)!.settings.arguments as String?;
    // Map<String, String?>;
    // final postId = routeArgs['postId'];
    // final currentActiveUserId = routeArgs['currentActiveUserId'];
    //TEST final dishId = ModalRoute.of(context)!.settings.arguments as String?;
    //TEST print(dishId);

    // Data pass from database -> 'posts.dart'
    // 'listen: false' As only get data once, and to not re-run build
    // (to keep updating widget when data changes)
    final loadedPost =
        Provider.of<Posts>(context, listen: false).findByPostId(postId!);

    // To get full dish data
    final dishId = loadedPost.dishId;
    final loadedDish =
        Provider.of<Dishes>(context, listen: false).findByDishId(dishId!);

    return Scaffold(
      appBar: AppBar(
        elevation: 0, // Remove shadow
        backgroundColor: mobileBackgroundColor,
        titleSpacing: 0,
        toolbarHeight: 64,
        automaticallyImplyLeading: false,
        title: Container(
          child: Row(
            children: [
              SizedBox(width: 16),

              // Back Icon
              GestureDetector(
                child: Icon(
                  Icons.arrow_back_ios,
                  color: neutral1Color,
                  size: 20,
                ),
                onTap: () => Navigator.pop(context),
              ),
              SizedBox(width: 8),

              // Search Bar
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 12,
                      top: 8,
                      bottom: 8,
                      right: 8,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.search,
                          color: neutral1Color,
                        ),
                        SizedBox(width: 4),
                        Text(
                          'Viral golden chicken burger',
                          style: TextStyle(
                              fontSize: 14,
                              color: neutral3Color,
                              fontFamily: 'OpenSans'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(width: 16),
            ],
          ),
        ),
      ),
      backgroundColor: mobileBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // SECTION 1: DISH IMAGES
            Container(
              width: MediaQuery.of(context).size.width,
              // '32' refer to margin's horizontal
              height: MediaQuery.of(context).size.width - 32 - 32,
              margin: const EdgeInsets.symmetric(
                horizontal: 32.0,
                vertical: 8.0,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(16.0),
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
              child: ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(16.0),
                ),
                child: Image.network(
                  loadedPost.postPhotoUrl,
                  // width: MediaQuery.of(context).size.width,
                  // height: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 8),

            // SECTION 2: DISH BASIC INFO
            DishDetailBasicInfo(loadedDish: loadedDish),
            SizedBox(height: 16),

            // SECTION 3: DISH REVIEWS & RATINGS
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 32,
              ),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(16.0)),
                boxShadow: [
                  BoxShadow(
                    color: neutral5Color,
                    spreadRadius: 0,
                    blurRadius: 16,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title: Reviews & Ratings
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Reviews & Ratings",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'OpenSans',
                            ),
                          ),
                        ),
                        Icon(Icons.arrow_forward_ios, size: 16),
                      ],
                    ),
                    SizedBox(height: 8),

                    // Filter: Delicious, Eat Again, Worth It
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: const BoxDecoration(
                            color: neutral6Color,
                            borderRadius: BorderRadius.all(
                              Radius.circular(4.0),
                            ),
                          ),
                          child: Text(
                            'Delicious',
                            style: TextStyle(
                              color: neutral2Color,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        SizedBox(width: 8),

                        // Eat Again
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: const BoxDecoration(
                            color: neutral6Color,
                            borderRadius: BorderRadius.all(
                              Radius.circular(4.0),
                            ),
                          ),
                          child: Text(
                            'Eat Again',
                            style: TextStyle(
                              color: neutral2Color,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        SizedBox(width: 8),

                        // Worth It
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: const BoxDecoration(
                            color: neutral6Color,
                            borderRadius: BorderRadius.all(
                              Radius.circular(4.0),
                            ),
                          ),
                          child: Text(
                            'Worth It',
                            style: TextStyle(
                              color: neutral2Color,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),

                    // Review 1
                    Column(
                      children: [
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.network(
                                'https://images.unsplash.com/photo-1606122017369-d782bbb78f32?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8cG9ydHJhaXQlMjBwaG90b2dyYXBoeXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=50&q=60',
                                height: 20,
                                width: 20,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(width: 4),
                            Expanded(
                              child: Text(
                                "Patricia",
                                style: TextStyle(
                                  color: neutral3Color,
                                ),
                              ),
                            ),
                            // Rating
                            DishRating(
                              dishRatingDelicious: 3,
                              dishRatingEatAgain: 4,
                              dishRatingWorthIt: 5,
                              showTotalRating: false,
                            ),
                          ],
                        ),
                        SizedBox(height: 4),
                        Text(
                          "The burger patty alone is delicious and paired off with the creaminess and buttery taste of the sauce.",
                          style: TextStyle(
                            color: neutral3Color,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),

                    // Review 2
                    Column(
                      children: [
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.network(
                                'https://images.unsplash.com/photo-1606122017369-d782bbb78f32?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8cG9ydHJhaXQlMjBwaG90b2dyYXBoeXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=50&q=60',
                                height: 20,
                                width: 20,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(width: 4),
                            Expanded(
                              child: Text(
                                "Patricia",
                                style: TextStyle(
                                  color: neutral3Color,
                                ),
                              ),
                            ),
                            // Rating
                            DishRating(
                              dishRatingDelicious: 3,
                              dishRatingEatAgain: 4,
                              dishRatingWorthIt: 5,
                              showTotalRating: false,
                            ),
                          ],
                        ),
                        SizedBox(height: 4),
                        Text(
                          "The burger patty alone is delicious and paired off with the creaminess and buttery taste of the sauce.",
                          style: TextStyle(
                            color: neutral3Color,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),

            // SECTION 4: SELLER BASIC INFO
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 32,
              ),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(16.0),
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
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        // Seller's Profile Picture
                        ClipRRect(
                          borderRadius: BorderRadius.circular(36.0),
                          child: Image.network(
                            'https://instagram.fkul10-1.fna.fbcdn.net/v/t51.2885-19/133585212_850140199117185_2772702535892613805_n.jpg?stp=dst-jpg_s150x150&_nc_ht=instagram.fkul10-1.fna.fbcdn.net&_nc_cat=109&_nc_ohc=NaQ6yrwAZwQAX8QZA7-&edm=ABmJApABAAAA&ccb=7-5&oh=00_AfDORAW0DHTBD-8J20DHCaRHId-h3Umw9KVZa1m9m0L6JQ&oe=63BB9DEA&_nc_sid=6136e7',
                            height: 72,
                            width: 72,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Seller's Name
                            Text(
                              "CC by Mel",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'OpenSans',
                                color: neutral1Color,
                              ),
                            ),

                            // Dish rating Summary
                            DishRating(
                              dishRatingDelicious: 4.52,
                              dishRatingEatAgain: 4.37,
                              dishRatingWorthIt: 4.68,
                              totalRating: 830,
                              showTotalRating: false,
                            ),
                            SizedBox(height: 4),

                            // Seller's Label
                            Row(
                              children: [
                                // Verified
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 4, vertical: 2),
                                  decoration: const BoxDecoration(
                                    color: neutral6Color,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4.0)),
                                  ),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        'assets/images/icons/verified_filled.png',
                                        width: 14,
                                        height: 14,
                                      ),
                                      SizedBox(width: 2),
                                      Text(
                                        "Verified",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: neutral2Color,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 8),

                                // Safe Food
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 4, vertical: 2),
                                  decoration: const BoxDecoration(
                                    color: neutral6Color,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4.0)),
                                  ),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        'assets/images/icons/safe_food_filled.png',
                                        width: 14,
                                        height: 14,
                                      ),
                                      SizedBox(width: 2),
                                      Text(
                                        "Safe Food",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: neutral2Color,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 4),

                    // Seller's Rating
                    // SellerRatingSummary(
                    //   averageRatingEnvironment: 4.28,
                    //   totalRating: 300,
                    // ),
                    // SizedBox(height: 4),

                    // Seller Operating Location
                    Text(
                      "Bukit Jalil, 57000 Kuala Lumpur",
                      style: TextStyle(
                        fontFamily: 'OpenSans',
                        color: neutral2Color,
                      ),
                    ),

                    // Seller Operating Time
                    Row(
                      children: [
                        Text(
                          "4:00pm - 11:00pm",
                          style: TextStyle(
                            fontFamily: 'OpenSans',
                            color: neutral2Color,
                          ),
                        ),
                        SizedBox(width: 8),
                        Text(
                          "(closing in 2 hours)",
                          style: TextStyle(
                            fontFamily: 'OpenSans',
                            color: primaryColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),

                    // Reviews, Followers, Sales
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              "58.2k",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                fontFamily: "OpenSans",
                                color: neutral2Color,
                              ),
                            ),
                            Text(
                              "Posts",
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: "OpenSans",
                                color: neutral3Color,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "3.4k",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                fontFamily: "OpenSans",
                                color: neutral2Color,
                              ),
                            ),
                            Text(
                              "Followers",
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: "OpenSans",
                                color: neutral3Color,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "18.5k",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                fontFamily: "OpenSans",
                                color: neutral2Color,
                              ),
                            ),
                            Text(
                              "Sales",
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: "OpenSans",
                                color: neutral3Color,
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          child: Container(
                            decoration: const BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.all(
                                Radius.circular(16.0),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16.0,
                                vertical: 8.0,
                              ),
                              child: Text(
                                "Shop",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: "OpenSans",
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context).pushNamed(
                              SellerProfileScreen.routeName,
                              arguments: loadedDish.sellerId,
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),

            // SECTION 5: INGREDIENTS & NUTRITIONS
            Container(
              margin: EdgeInsets.symmetric(horizontal: 32),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(16.0)),
                boxShadow: [
                  BoxShadow(
                    color: neutral5Color,
                    spreadRadius: 0,
                    blurRadius: 16,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Main Ingredient
                    Text(
                      "Main Ingredients",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OpenSans',
                        color: neutral1Color,
                      ),
                    ),
                    Text(
                      loadedDish.dishMainIngredient,
                      style: TextStyle(
                        fontFamily: 'OpenSans',
                        color: neutral2Color,
                      ),
                    ),
                    SizedBox(height: 8),

                    // Ingredient
                    Text(
                      'Ingredients',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OpenSans',
                        color: neutral1Color,
                      ),
                    ),
                    Text(
                      loadedDish.dishIngredient,
                      style: TextStyle(
                        fontFamily: 'OpenSans',
                        color: neutral2Color,
                      ),
                    ),
                    SizedBox(height: 8),

                    // Nutrition
                    Text(
                      'Nutritions',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OpenSans',
                        color: neutral1Color,
                      ),
                    ),
                    Text(
                      loadedDish.dishNutrition,
                      style: TextStyle(
                        fontFamily: 'OpenSans',
                        color: neutral2Color,
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}

class DishDetailBasicInfo extends StatelessWidget {
  const DishDetailBasicInfo({
    Key? key,
    required this.loadedDish,
  }) : super(key: key);

  final Dish loadedDish;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 32,
      ),
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
        boxShadow: [
          BoxShadow(
            color: neutral5Color,
            spreadRadius: 0,
            blurRadius: 16,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                // Dish Name
                Expanded(
                  child: Text(
                    loadedDish.dishName!,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: neutral1Color,
                      fontFamily: 'OpenSans',
                    ),
                  ),
                ),

                // Dish Price
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'RM',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: neutral2Color,
                          fontFamily: 'OpenSans',
                        ),
                      ),
                      SizedBox(width: 4),
                      Text(
                        loadedDish.dishPrice!.toStringAsFixed(2),
                        style: TextStyle(
                          fontSize: 20,
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
            SizedBox(height: 4),

            // Ratings
            DishRating(
              dishRatingDelicious: 5.0,
              dishRatingEatAgain: 4.9,
              dishRatingWorthIt: 4.3,
              totalRating: 235,
              showTotalRating: true,
            ),

            SizedBox(height: 8),

            Row(
              children: [
                Text(
                  'Tried by ',
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: 'OpenSans',
                  ),
                ),
                Text(
                  'Jane',
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  ', ',
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: 'OpenSans',
                  ),
                ),
                Text(
                  'Peter',
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  ', and ',
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: 'OpenSans',
                  ),
                ),
                Text(
                  '13 others',
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(child: SizedBox()),

                // Button: Like
                Image.asset(
                  'assets/images/icons/love.png',
                  width: 16,
                  height: 16,
                  color: neutral1Color,
                ),
                SizedBox(width: 8),

                // Button: Save
                Image.asset(
                  'assets/images/icons/bookmark.png',
                  width: 16,
                  height: 16,
                  color: neutral1Color,
                ),
                SizedBox(width: 8),

                // Button: Share
                Image.asset(
                  'assets/images/icons/share.png',
                  width: 16,
                  height: 16,
                  color: neutral1Color,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
