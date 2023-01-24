import 'package:flutter/material.dart';
import 'package:foodport_app/screens/5_profile_screen/user_profile_all_post_screen.dart';
import 'package:foodport_app/utils/colors.dart';
import 'package:image_picker/image_picker.dart';

import '../1_feed_post_screen/feed_post_nearby_screen.dart';
import 'user_profile_like_post_screen.dart';
import 'user_profile_save_post_screen.dart';
import 'user_profile_screen_post_header.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late ScrollController _scrollViewController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
    _scrollViewController = ScrollController(initialScrollOffset: 0.0);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mobileBackgroundColor,
      body: NestedScrollView(
        controller: _scrollViewController,
        headerSliverBuilder: (BuildContext context, bool boxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              titleSpacing: 0, // no space horizontally
              backgroundColor: mobileBackgroundColor,
              surfaceTintColor: mobileBackgroundColor,

              // Title
              collapsedHeight: 58,
              title: Container(
                height: 48,
                alignment: Alignment.centerRight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.black45,
                        borderRadius: BorderRadius.all(
                          Radius.circular(16),
                        ),
                      ),
                      child: Image.asset(
                        "assets/images/icons/search.png",
                        color: Colors.white,
                        height: 16,
                        width: 16,
                      ),
                    ),
                    SizedBox(width: 12),
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.black45,
                        borderRadius: BorderRadius.all(
                          Radius.circular(16),
                        ),
                      ),
                      child: Image.asset(
                        "assets/images/icons/hamburger.png",
                        color: Colors.white,
                        height: 16,
                        width: 16,
                      ),
                    ),
                    SizedBox(width: 16),
                  ],
                ),
              ),

              // User Basic Info
              expandedHeight: 600,
              // TODO: Advance Improvement https://stackoverflow.com/questions/50909791/flutter-change-text-when-flexiblespacebar-is-collapsed
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  color: mobileBackgroundColor, // Colors.amber,
                  child: Column(
                    children: [
                      // SECTION 1: PROFILE & COVER PHOTO
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
                              "https://media.istockphoto.com/id/1094435394/photo/west-african-food-assortment.jpg?s=612x612&w=0&k=20&c=2UUjfNI3BAtaGp-n75X3WJCC2H3xD5U_CEK4FtwUoE4=",
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
                                        'https://media.istockphoto.com/id/936928380/photo/portrait-of-a-mid-adult-male.jpg?s=612x612&w=0&k=20&c=U_nnHIwP61jYJvRhjCdOjrye4CPlcOCmKmHKXefoiPg=',
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                      SizedBox(height: 16),

                      // SECTION 2: USER DETAIL CARD
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                                  style: TextStyle(
                                    color: neutral1Color,
                                  ),
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
                                            padding:
                                                const EdgeInsets.only(top: 2.0),
                                            child: Text(
                                              "21yr",
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: neutral1Color,
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
                                          color: neutral1Color,
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
                      SizedBox(height: 32),
                    ],
                  ),
                ),
              ),

              // Tab Bar
              elevation: 0,
              pinned: true,
              floating: true,
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(50.0),
                child: Container(
                  color: mobileBackgroundColor,
                  child: TabBar(
                    labelColor: primaryColor,
                    unselectedLabelColor: neutral1Color,
                    indicatorColor: primaryColor,
                    tabs: <Widget>[
                      Tab(
                        icon: Image.asset(
                          "assets/images/icons/grid.png",
                          height: 20,
                          width: 20,
                        ),
                      ),
                      Tab(
                        icon: Image.asset(
                          "assets/images/icons/bookmark.png",
                          height: 20,
                          width: 20,
                        ),
                      ),
                      Tab(
                        icon: Image.asset(
                          "assets/images/icons/love.png",
                          height: 20,
                          width: 20,
                        ),
                      )
                    ],
                    controller: _tabController,
                  ),
                ),
              ),
              // bottom: TabBar(
              //   labelColor: primaryColor,
              //   unselectedLabelColor: neutral1Color,
              //   indicatorColor: primaryColor,
              //   tabs: <Widget>[
              //     Tab(
              //       icon: Image.asset(
              //         "assets/images/icons/grid.png",
              //         height: 20,
              //         width: 20,
              //       ),
              //     ),
              //     Tab(
              //       icon: Image.asset(
              //         "assets/images/icons/bookmark.png",
              //         height: 20,
              //         width: 20,
              //       ),
              //     ),
              //     Tab(
              //       icon: Image.asset(
              //         "assets/images/icons/love.png",
              //         height: 20,
              //         width: 20,
              //       ),
              //     )
              //   ],
              //   controller: _tabController,
              // ),
            )
          ];
        },
        body: TabBarView(
          children: <Widget>[
            UserProfileAllPostScreen(),
            UserProfileSavePostScreen(),
            UserProfileLikePostScreen(),
          ],
          controller: _tabController,
        ),
      ),
    );
  }
}
