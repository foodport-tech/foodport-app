import 'package:flutter/material.dart';
import 'package:foodport_app/responsive/feed_post_screen.dart';
import 'package:foodport_app/screens/create_post_screen.dart';

const tabletScreenSize = 576;
const webScreenSize = 992;

// Display different screens for different bottom bar button in mobile_screen_layout.dart
const homeScreenItems = [
  FeedPostScreen(),
  // For Screen 3: Create Post
  Center(child: Text('explore')),
  AddPostScreen(),
  Center(child: Text('inbox')),
  Center(child: Text('profile')),
];
