import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/post.dart';
import '../widgets/post_card.dart';
import '../utils/colors.dart';

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
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        elevation: 0, // Remove shadow
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(
            Icons.add,
            color: neutral1Color,
          ),
          onPressed: () {},
        ),
        title: Row(
          children: [
            Text(
              'Nearby',
              style: TextStyle(color: neutral1Color),
            ),
            SizedBox(
              width: 16,
            ),
            Text(
              'Following',
              style: TextStyle(color: primaryColor),
            ),
            SizedBox(
              width: 16,
            ),
            Text(
              'For You',
              style: TextStyle(color: neutral1Color),
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search,
              color: neutral1Color,
            ),
            tooltip: 'Open shopping cart',
            onPressed: () {
              // handle the press
            },
          ),
        ],
      ),
      body: StreamBuilder(
        // To get real time data
        stream: FirebaseFirestore.instance.collection('posts').snapshots(),
        builder: (
          context,
          AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot,
        ) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return PageView.builder(
            // To list the Amount of posts Available in Database,
            // or else will display infinity amount of posts
            scrollDirection: Axis.vertical,
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) => PostCard(
              // Pass data from Firebase
              // 'index' Means for each item in the database
              snap: snapshot.data!.docs[index].data(),
            ),
          );
        },
      ),
    );
  }
}
