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
          // TOP SECTION: USER'S PROFILE PICTURE & COVER
          Stack(
            children: [
              Image.network(
                "https://media-cdn.tripadvisor.com/media/photo-s/1b/3f/c1/f1/kj-coffee-shop-es-un.jpg",
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width / 3 * 2,
                fit: BoxFit.cover,
              ),
              // Blur Gradient
              ImageFiltered(
                imageFilter: ImageFilter.blur(sigmaX: 3, sigmaY: 0),
                child: ShaderMask(
                  shaderCallback: (rect) {
                    return LinearGradient(
                      begin: Alignment.center,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black,
                        Colors.black.withOpacity(0),
                      ],
                      stops: [0.4, 0.75],
                    ).createShader(rect);
                  },
                  blendMode: BlendMode.dstOut,
                  child: Image.network(
                    "https://media-cdn.tripadvisor.com/media/photo-s/1b/3f/c1/f1/kj-coffee-shop-es-un.jpg",
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width / 3 * 2,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // Shadow Gradient
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width / 3 * 2,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.center,
                    colors: [
                      Colors.black54,
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width / 3 * 2,
                padding: EdgeInsets.all(16),
                alignment: Alignment.bottomLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // User's Name
                            Text(
                              "Jeremy Chong",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 4),

                            // User's Username
                            Text(
                              "Username: @jeremychong",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),

          // MIDDLE SECTION: USER'S INFO
          Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                // Likes, Followers, Following, Friends
                Row(
                  children: [
                    Column(
                      children: [
                        Text("58.2k"),
                        Text("Likes"),
                      ],
                    )
                  ],
                ),

                // Bio

                // Age, Location, University/Occupation

                // IP Address

                // Edit Profile, Add Friend
              ],
            ),
          ),

          // BOTTOM SECTION: USER'S POSTS
        ],
      ),
    );
  }
}
