import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/posts.dart';
import '../../utils/colors.dart';
import '../../widgets/post_card/post_card_page_view.dart';

class FeedPostNearbyScreen extends StatelessWidget {
  FeedPostNearbyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Listener
    final postsData = Provider.of<Posts>(context);
    // IMPROVEMENT: postsData.nearbyItems
    // to only get posts from the accounts followed
    final posts = postsData.postItems;

    return Scaffold(
      backgroundColor: mobileBackgroundColor,
      body: PostCardPageView(posts: posts),
    );
  }
}
