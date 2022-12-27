import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../screens/feed_post_screen.dart';
import '../screens/create_post_screen.dart';
import '../screens/feed_post_screen_ig.dart';
import '../screens/profile_screen_ig.dart';
import '../screens/search_screen_ig.dart';

const tabletScreenSize = 576;
const webScreenSize = 992;

// Display different screens for different bottom bar button in mobile_screen_layout.dart
List<Widget> homeScreenItems = [
  // FeedPostScreenIG(),
  const FeedPostScreen(),
  // For Screen 3: Create Post
  const SearchScreenIG(),
  //Center(child: Text('explore')),
  const AddPostScreen(),
  const Center(child: Text('inbox')),
  ProfileScreenIG(
    uid: FirebaseAuth.instance.currentUser!.uid,
  ),
];
