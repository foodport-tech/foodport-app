import 'package:flutter/material.dart';

import '../screens/feed_post_screen.dart';
import '../screens/create_post_screen.dart';
import '../screens/feed_post_screen_ig.dart';

const tabletScreenSize = 576;
const webScreenSize = 992;

// Display different screens for different bottom bar button in mobile_screen_layout.dart
const homeScreenItems = [
  // FeedPostScreenIG(),
  FeedPostScreen(),
  // For Screen 3: Create Post
  Center(child: Text('explore')),
  AddPostScreen(),
  Center(child: Text('inbox')),
  Center(child: Text('profile')),
];
