import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/post.dart';
import '../../providers/posts.dart';
import 'post_card.dart';

class PostCardPageView extends StatelessWidget {
  final List<Post> posts;
  PostCardPageView({super.key, required this.posts});

  @override
  Widget build(BuildContext context) {
    print("//post_card_page_view.dart - posts: $posts");
    print("//post_card_page_view.dart - posts.length: ${posts.length}");
    print("//post_card_page_view.dart - posts[1]: ${posts[1]}");

    return PageView.builder(
      // onPageChanged: (pageIndex) {} // To track the current page
      scrollDirection: Axis.vertical,
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return ChangeNotifierProvider.value(
          value: posts[index],
          child: PostCard(),
        );
      },
    );
  }
}
