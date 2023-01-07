import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodport_app/screens/5_profile_screen/user_profile_screen.dart';

import '../screens/2_explore_screen/explore_screen.dart';
import '../screens/1_feed_post_screen/feed_post_screen.dart';
import '../screens/3_create_post_screen/create_post_screen.dart';
import '../screens/ig_screen/feed_post_screen_ig.dart';
import '../screens/ig_screen/profile_screen_ig.dart';
import '../screens/ig_screen/search_screen_ig.dart';

const tabletScreenSize = 576;
const webScreenSize = 992;

// Display different screens for different bottom bar button in mobile_screen_layout.dart
List<Widget> homeScreenItems = [
  // FeedPostScreenIG(),
  FeedPostScreen(),
  // For Screen 3: Create Post
  ExploreScreen(),
  // const SearchScreenIG(),
  //Center(child: Text('explore')),
  const CreatePostScreen(),
  const Center(child: Text('inbox')),
  const UserProfileScreen(),
  // ProfileScreenIG(
  //     uid: FirebaseAuth.instance.currentUser!.uid,
  //     ),
];
