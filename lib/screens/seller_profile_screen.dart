import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/colors.dart';
import '../widgets/dish_rating.dart';

class SellerProfileScreen extends StatefulWidget {
  const SellerProfileScreen({super.key});
  static const routeName = '/seller_profile';

  @override
  State<SellerProfileScreen> createState() => _SellerProfileScreenState();
}

class _SellerProfileScreenState extends State<SellerProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0, // Remove shadow
        backgroundColor: mobileBackgroundColor,
        surfaceTintColor: mobileBackgroundColor,
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
            // Seller Photo
            Container(
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
                  "https://lh3.googleusercontent.com/p/AF1QipN63ym-_e3hlIhsueMG6m-G31_W_RXotd61RCZu=s680-w680-h510",
                  width: 364,
                  height: 243,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Seller's Basic Info
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(
                horizontal: 32,
                vertical: 8,
              ),
              padding: EdgeInsets.all(16.0),
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
              child: Column(
                children: [
                  // Seller's Basic Info: Top
                  Row(
                    children: [
                      // Seller's Profile Picture
                      Container(
                        height: 72,
                        width: 72,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: neutral6Color,
                          ),
                          borderRadius: BorderRadius.circular(36.0),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(36.0),
                          child: Image.network(
                            'https://img.freepik.com/premium-vector/restaurant-logo-restaurant-logo-design-vector-template-stock-vector_664675-352.jpg',
                            height: 71,
                            width: 71,
                            fit: BoxFit.cover,
                          ),
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
                  SizedBox(height: 8),

                  // Tried by, Like, Save, Share
                  Row(
                    children: [
                      Text(
                        'Tried by ',
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'OpenSans',
                          color: neutral2Color,
                        ),
                      ),
                      Text(
                        'Jane',
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'OpenSans',
                          fontWeight: FontWeight.bold,
                          color: neutral2Color,
                        ),
                      ),
                      Text(
                        ', ',
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'OpenSans',
                          color: neutral2Color,
                        ),
                      ),
                      Text(
                        'Peter',
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'OpenSans',
                          fontWeight: FontWeight.bold,
                          color: neutral2Color,
                        ),
                      ),
                      Text(
                        ', and ',
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'OpenSans',
                          color: neutral2Color,
                        ),
                      ),
                      Text(
                        '13 others',
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'OpenSans',
                          fontWeight: FontWeight.bold,
                          color: neutral2Color,
                        ),
                      ),
                      Expanded(child: SizedBox()),
                    ],
                  ),
                  SizedBox(height: 8),

                  // Seller's Basic Info: Line
                  Divider(height: 1),
                  SizedBox(height: 8),

                  // Seller's Basic Info: Bottom
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 48.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Trending
                        Column(
                          children: [
                            Text(
                              "#105",
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: "OpenSans",
                                fontWeight: FontWeight.bold,
                                color: neutral2Color,
                              ),
                            ),
                            Text(
                              "Trending",
                              style: TextStyle(
                                fontFamily: "OpenSans",
                                color: neutral2Color,
                              ),
                            ),
                          ],
                        ),

                        // Followers
                        Column(
                          children: [
                            Text(
                              "3.4k",
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: "OpenSans",
                                fontWeight: FontWeight.bold,
                                color: neutral2Color,
                              ),
                            ),
                            Text(
                              "Followers",
                              style: TextStyle(
                                fontFamily: "OpenSans",
                                color: neutral2Color,
                              ),
                            ),
                          ],
                        ),
                        // Posts
                        Column(
                          children: [
                            Text(
                              "58.2k",
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: "OpenSans",
                                fontWeight: FontWeight.bold,
                                color: neutral2Color,
                              ),
                            ),
                            Text(
                              "Posts",
                              style: TextStyle(
                                fontFamily: "OpenSans",
                                color: neutral2Color,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8),

                  Container(
                    width:
                        MediaQuery.of(context).size.width - 32 - 32 - 16 - 16,
                    child: Row(
                      children: [
                        // Follow Button
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            width: 64,
                            decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.all(
                                Radius.circular(8.0),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8.0,
                              ),
                              child: Text(
                                "Follow",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: "OpenSans",
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 16),
                        // Message Button
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            width: 64,
                            decoration: BoxDecoration(
                              color: neutral6Color,
                              borderRadius: BorderRadius.all(
                                Radius.circular(8.0),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8.0,
                              ),
                              child: Text(
                                "Message",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: "OpenSans",
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),

                  Divider(height: 1),
                  SizedBox(height: 8),

                  // Dish Price Range, Like, Save, Share
                  Row(
                    children: [
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
                              "13", //loadedDish.dishPrice!.toStringAsFixed(2),
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: primaryColor,
                                fontFamily: 'OpenSans',
                              ),
                            ),
                            Text(
                              " - ", //loadedDish.dishPrice!.toStringAsFixed(2),
                              style: TextStyle(
                                fontSize: 20,
                                color: neutral2Color,
                                fontFamily: 'OpenSans',
                              ),
                            ),
                            Text(
                              "67", //loadedDish.dishPrice!.toStringAsFixed(2),
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
                      Expanded(child: SizedBox()),
                      // Button: Like
                      Image.asset(
                        'assets/images/icons/love.png',
                        width: 24,
                        height: 24,
                        color: neutral2Color,
                      ),
                      SizedBox(width: 16),

                      // Button: Save
                      Image.asset(
                        'assets/images/icons/bookmark.png',
                        width: 24,
                        height: 24,
                        color: neutral2Color,
                      ),
                      SizedBox(width: 16),

                      // Button: Share
                      Image.asset(
                        'assets/images/icons/share.png',
                        width: 24,
                        height: 24,
                        color: neutral2Color,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Seller's Contact Info
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(
                horizontal: 32,
                vertical: 8,
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
              child: Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Address
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Address: ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: neutral2Color,
                            ),
                          ),
                        ),
                        Image.asset(
                          'assets/images/icons/direction.png',
                          color: neutral2Color,
                          width: 24,
                          height: 24,
                        ),
                      ],
                    ),
                    Text(
                      "CC by Mel, Residensi Park, 2-13, Persiaran Jalil Utama, Bukit Jalil, 57000 Kuala Lumpur, Federal Territory of Kuala Lumpur",
                      style: TextStyle(
                        color: neutral2Color,
                      ),
                    ),
                    SizedBox(height: 8),

                    // Hours
                    Row(
                      children: [
                        Text(
                          "Hours: ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: neutral2Color,
                          ),
                        ),
                        Text(
                          "9am - 10pm",
                          style: TextStyle(
                            color: neutral2Color,
                          ),
                        ),
                        Text(
                          " (closing in 2 hours)",
                          style: TextStyle(
                            color: primaryColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),

                    // Phone
                    Row(
                      children: [
                        Text(
                          "Phone: ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: neutral2Color,
                          ),
                        ),
                        Text(
                          "010-286 8617",
                          style: TextStyle(
                            color: neutral2Color,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),

                    // Website
                    Row(
                      children: [
                        Text(
                          "Website: ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: neutral2Color,
                          ),
                        ),
                        Text(
                          "ccbymel.com",
                          style: TextStyle(
                            color: neutral2Color,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),

                    Divider(height: 1),
                    SizedBox(height: 16),

                    // Social Media Links
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 108.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(4.0),
                            ),
                            child: Image.network(
                              "https://ssl.gstatic.com/kpui/social/fb_32x32.png",
                              width: 24,
                              height: 24,
                            ),
                          ),
                          ClipRRect(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(4.0),
                            ),
                            child: Image.network(
                              "https://ssl.gstatic.com/kpui/social/instagram_32x32.png",
                              width: 24,
                              height: 24,
                            ),
                          ),
                          ClipRRect(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(4.0),
                            ),
                            child: Image.network(
                              "https://ssl.gstatic.com/kpui/social/linkedin_32x32.png",
                              width: 24,
                              height: 24,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Seller's Menu Category
            Container(
              height: 140,
              child: ListView.builder(
                padding: EdgeInsets.only(
                  left: 24,
                  right: 24,
                ),
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) => ChangeNotifierProvider.value(
                  value: null,
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(8),
                    margin: EdgeInsets.only(
                      top: 16,
                      bottom: 22,
                      left: 8,
                      right: 8,
                    ),
                    width: 100,
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
                    child: Text(
                      "Category Name",
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: "OpenSans",
                        color: neutral1Color,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),

            // Seller's Menu Item
            GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 10,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.597,
                crossAxisSpacing: 0,
                mainAxisSpacing: 0,
              ),
              padding: EdgeInsets.only(
                left: 24,
                right: 24,
              ),
              itemBuilder: (context, index) => Container(
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
                          width: 166,
                          height: 166,
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
                                  "Dish Name Dish Name", //dishes[index].dishName!
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
                                      "12.30", //dishes[index].dishPrice!.toStringAsFixed(2)
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

            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
