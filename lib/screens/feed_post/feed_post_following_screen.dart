import 'package:flutter/material.dart';

import '../../models/post.dart';
import '../../widgets/post_card/post_card.dart';

class FeedPostFollowingScreen extends StatelessWidget {
  // Data Source - Post Content
  final List<Post> loadedPosts = [
    Post(
      postId: 'p1',
      postPhotoUrl:
          'https://media.istockphoto.com/id/1309352410/photo/cheeseburger-with-tomato-and-lettuce-on-wooden-board.jpg?s=612x612&w=0&k=20&c=lfsA0dHDMQdam2M1yvva0_RXfjAyp4gyLtx4YUJmXgg=',
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

  FeedPostFollowingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: loadedPosts.length,
        itemBuilder: (context, index) => PostCard(
          postId: loadedPosts[index].postId,
          postPhotoUrl: loadedPosts[index].postPhotoUrl,
          postPublishDateTime: loadedPosts[index].postPublishDateTime,
          postRatingRecommend: loadedPosts[index].postRatingRecommend,
          postRatingStar: loadedPosts[index].postRatingStar,
          postRatingWorthIt: loadedPosts[index].postRatingWorthIt,
          postReview: loadedPosts[index].postReview,
        ),
      ),
    );
  }
}
