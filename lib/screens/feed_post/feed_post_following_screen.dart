import 'package:flutter/material.dart';

import '../../widgets/post_card.dart';

class FeedPostFollowingScreen extends StatelessWidget {
  const FeedPostFollowingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        // To list the Amount of posts Available in Database,
        // or else will display infinity amount of posts
        scrollDirection: Axis.vertical,
        itemCount: 3,
        // TOFIX: Firebase
        // itemCount: snapshot.data!.docs.length,
        itemBuilder: (context, index) => PostCard(
            // TOFIX: Firebase
            // Pass data from Firebase
            // 'index' Means for each item in the database
            // snap: snapshot.data!.docs[index].data(),
            ),
      ),
    );
  }
}
