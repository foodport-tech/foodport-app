import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/posts.dart';
import '../../widgets/post_card/post_page_view.dart';

class FeedPostFollowingScreen extends StatelessWidget {
  FeedPostFollowingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Listener
    final postsData = Provider.of<Posts>(context);
    // IMPROVEMENT: postsData.followingItems
    // to only get posts from the accounts followed
    final posts = postsData.postItems;

    return Scaffold(
      body: PostsPageView(posts: posts),
    );
  }
}
