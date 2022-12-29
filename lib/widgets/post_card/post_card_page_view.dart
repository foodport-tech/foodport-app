import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/post.dart';
import '../../providers/posts.dart';
import 'post_card.dart';

class PostCardPageView extends StatelessWidget {
  final posts;
  PostCardPageView({super.key, required this.posts});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      // onPageChanged: (pageIndex) {} // To track the current page
      scrollDirection: Axis.vertical,
      itemCount: posts.length,
      itemBuilder: (context, index) => ChangeNotifierProvider<Post>.value(
        value: posts[index],
        child: PostCard(),
      ),
    );
  }
}
