import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/post.dart';
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
      itemBuilder: (context, index) => ChangeNotifierProvider<Post>.value(
        value: posts[index],
        child: PostCard(),
      ),
    );
  }
}
