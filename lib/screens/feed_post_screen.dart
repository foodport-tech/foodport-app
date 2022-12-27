import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/post.dart';
import '../utils/colors.dart';
import 'feed_post/feed_post_nearby_screen.dart';
import 'feed_post/feed_post_following_screen.dart';
import 'feed_post/feed_post_for_you_screen.dart';

class FeedPostScreen extends StatelessWidget {
  final List<Post> loadedPosts = [
    Post(
      postId: 'p1',
      postPhotoUrl: 'https://',
      postPublishDateTime: DateTime(2022, 12, 25),
      postRatingRecommend: 4.0,
      postRatingStar: 3.0,
      postRatingWorthIt: 5.0,
      postReview: 'This food is good.',
    ),
    Post(
      postId: 'p2',
      postPhotoUrl: 'https://',
      postPublishDateTime: DateTime(2022, 11, 30),
      postRatingRecommend: 3.0,
      postRatingStar: 4.0,
      postRatingWorthIt: 4.0,
      postReview: 'The cheese is delicious.',
    ),
  ];
  FeedPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      // "length: 3" refer to 'Nearby', 'Following' , 'For You'
      length: 3,
      child: Scaffold(
        extendBodyBehindAppBar: false,
        appBar: AppBar(
          elevation: 0, // Remove shadow
          backgroundColor: Colors.transparent,

          // Add Content Button
          leading: IconButton(
            icon: const Icon(
              Icons.add,
              color: neutral1Color,
            ),
            onPressed: () {},
          ),

          // Feed Post Navigation
          title: const TabBar(
            // Both Selected & Unselected label
            labelStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            // Selected Label
            labelColor: orange1Color,
            // Unselected Label
            unselectedLabelColor: neutral1Color,

            // Indicator (Underline below the Tab)
            indicatorWeight: 0.01,
            indicatorColor: Colors.transparent,

            // Tabs
            tabs: [
              Tab(
                text: 'Nearby',
              ),
              Tab(
                text: 'Following',
              ),
              Tab(
                text: 'For You',
              ),
            ],

            // Padding (for each tab)
            labelPadding: EdgeInsets.all(0),
            // Padding (for entire tabs)
            padding: EdgeInsets.symmetric(horizontal: 16),
          ),

          // Search Button
          actions: [
            IconButton(
              icon: const Icon(
                Icons.search,
                color: neutral1Color,
              ),
              onPressed: () {
                // handle the press
              },
            ),
          ],
        ),
        body: const TabBarView(
          children: [
            FeedPostNearbyScreen(),
            FeedPostFollowingScreen(),
            FeedPostForYouScreen(),
          ],
        ),
      ),
    );
  }
}
