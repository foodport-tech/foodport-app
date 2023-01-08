import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:foodport_app/utils/colors.dart';
import 'package:image_picker/image_picker.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: mobileBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.all(
                  Radius.circular(16),
                ),
              ),
              child: Image.asset(
                "assets/images/icons/bookmark.png",
                color: Colors.white,
                height: 16,
                width: 16,
              ),
            ),
            SizedBox(width: 12),
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.all(
                  Radius.circular(16),
                ),
              ),
              child: Image.asset(
                "assets/images/icons/bookmark.png",
                color: Colors.white,
                height: 16,
                width: 16,
              ),
            ),
            SizedBox(width: 12),
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.all(
                  Radius.circular(16),
                ),
              ),
              child: Image.asset(
                "assets/images/icons/bookmark.png",
                color: Colors.white,
                height: 16,
                width: 16,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  // borderRadius: BorderRadius.all(
                  //   Radius.circular(16.0),
                  // ),
                  boxShadow: [
                    BoxShadow(
                      color: neutral5Color,
                      spreadRadius: 0,
                      blurRadius: 16,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                // child: ClipRRect(
                // borderRadius: const BorderRadius.all(
                //   Radius.circular(16.0),
                // ),
                child: Image.network(
                  "https://media-cdn.tripadvisor.com/media/photo-s/1b/3f/c1/f1/kj-coffee-shop-es-un.jpg",
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width / 3 * 2,
                  fit: BoxFit.cover,
                ),
                // ),
              ),

              // User Profile Card
              Padding(
                padding: EdgeInsets.only(
                  // '32' refer to Container padding,
                  // '96' refer to size of Profile Picture
                  top: MediaQuery.of(context).size.width / 3 * 2 -
                      ((32 + 96) / 2),
                  left: 32.0,
                  right: 32.0,
                ),
                child: Container(
                  padding: EdgeInsets.all(16),
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.all(
                      Radius.circular(32.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white70, // neutral5Color,
                        spreadRadius: 0,
                        blurRadius: 64, // 16,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      // Profile Picture
                      Container(
                        height: 96,
                        width: 96,
                        decoration: BoxDecoration(
                          color: neutral6Color,
                          borderRadius: BorderRadius.circular(96),
                        ),
                        padding: EdgeInsets.all(2),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(96.0),
                          child: Image.network(
                            'https://instagram.fkul10-1.fna.fbcdn.net/v/t51.2885-19/241461462_270079921407951_7468759206826799783_n.jpg?stp=dst-jpg_s150x150&_nc_ht=instagram.fkul10-1.fna.fbcdn.net&_nc_cat=103&_nc_ohc=Y-O5tWwzPNgAX8Zkqjt&edm=ACWDqb8BAAAA&ccb=7-5&oh=00_AfA8NGJlCJaRI-n3Jnng71R2Cn18LOeD_5mwHiX9RlSkHQ&oe=63BBF319&_nc_sid=1527a3',
                            height: 94,
                            width: 94,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 16),

                      // Right Section
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // User's Name
                            Text(
                              "Jeremy Chong",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: neutral1Color,
                              ),
                            ),

                            SizedBox(height: 4),

                            // User's Username
                            Text(
                              "Username: @jeremychong",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: TextStyle(
                                fontSize: 12,
                                color: neutral1Color,
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

          // USER DETAIL CARD
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 32.0,
            ),
            child: Container(
              padding: EdgeInsets.all(16),
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
              child: Column(
                children: [
                  // Likes, Followers, Following, Friends
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Likes
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
                            "Likes",
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
                            "19.7k",
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

                      // Following
                      Column(
                        children: [
                          Text(
                            "521",
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: "OpenSans",
                              fontWeight: FontWeight.bold,
                              color: neutral2Color,
                            ),
                          ),
                          Text(
                            "Following",
                            style: TextStyle(
                              fontFamily: "OpenSans",
                              color: neutral2Color,
                            ),
                          ),
                        ],
                      ),

                      // Friends
                      Column(
                        children: [
                          Text(
                            "220",
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: "OpenSans",
                              fontWeight: FontWeight.bold,
                              color: neutral2Color,
                            ),
                          ),
                          Text(
                            "Friends",
                            style: TextStyle(
                              fontFamily: "OpenSans",
                              color: neutral2Color,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 8),

                  // Divider
                  Divider(height: 1),
                  SizedBox(height: 8),

                  // Bio
                  Container(
                    width: double.infinity,
                    child: Text(
                      "I see food, I eat it. \n👦🏻 ENFJ-A \n🕵🏻 Cheese, Matcha, Ice Cream, Repeat ",
                    ),
                  ),
                  SizedBox(height: 4),

                  // Age, Location, University/Career
                  Container(
                    width: double.infinity,
                    child: Row(
                      children: [
                        // Gender, Age
                        Container(
                          padding: EdgeInsets.only(
                            left: 8,
                            right: 8,
                            bottom: 2,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(4),
                            ),
                            color: neutral6Color,
                          ),
                          child: Row(
                            children: [
                              Text(
                                "♂ ",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: blue2Color,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 2.0),
                                child: Text(
                                  "21yr",
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 8),

                        // Location
                        Container(
                          padding: EdgeInsets.only(
                            left: 8,
                            right: 8,
                            bottom: 5,
                            top: 5,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(4),
                            ),
                            color: neutral6Color,
                          ),
                          child: Text(
                            "Bukit Jalil · Kuala Lumpur",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 2),

                  // IP Address
                  Container(
                    width: double.infinity,
                    child: Text(
                      "IP Address: Kuala Lumpur",
                      style: TextStyle(
                        fontSize: 11,
                        color: neutral4Color,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
