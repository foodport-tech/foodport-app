import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/posts.dart';
import 'post_card.dart';

class PostsPageView extends StatelessWidget {
  final posts;
  const PostsPageView({super.key, required this.posts});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      itemCount: posts.length,
      itemBuilder: (context, index) => PostCard(
        postId: posts[index].postId,
        postPhotoUrl: posts[index].postPhotoUrl,
        postPublishDateTime: posts[index].postPublishDateTime,
        postRatingRecommend: posts[index].postRatingRecommend,
        postRatingStar: posts[index].postRatingStar,
        postRatingWorthIt: posts[index].postRatingWorthIt,
        postReview: posts[index].postReview,
        userId: posts[index].userId,
        dishId: posts[index].dishId,
      ),
    );
  }
}
