import 'package:flutter/material.dart';
import 'package:foodport_app/screens/create_post_screen.dart';

const tabletScreenSize = 576;
const webScreenSize = 992;

// Display different screens for different bottom bar button in mobile_screen_layout.dart
const homeScreenItems = [
  // For Screen 3: Create Post
  AddPostScreen(),
  // Center(child: Text('home')),
  Center(child: Text('explore')),
  Center(child: Text('Create Post')),
  Center(child: Text('inbox')),
  Center(child: Text('profile')),
];
