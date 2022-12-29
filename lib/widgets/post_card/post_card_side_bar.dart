import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/post.dart';
import '../../screens/dish_detail_screen.dart';
import '../../utils/colors.dart';
import '../like_animation.dart';

class PostCardSideBar extends StatelessWidget {
  const PostCardSideBar({
    Key? key,
    required this.post,
  }) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    // TODO: Replace Provider with Stateful widget for the toggleLikeStatus()
    final post = Provider.of<Post>(context, listen: false);

    bool _likeStatus = post.postLike.containsKey('u1');

    return Container(
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          // Food Menu Section
          // TODO: If post tagged dish, then only show this
          IconButton(
            icon: const Icon(
              Icons.menu_book_outlined,
              size: 24,
            ),
            onPressed: () {
              // Better method
              Navigator.of(context).pushNamed(
                DishDetailScreen.routeName,
                arguments: post.postId,
                // arguments: {
                //   'postId': post.postId,
                //   // TODO: Replace with current active user's userId
                //   'currentActiveUserId': 'u1',
                // },
                // arguments: widget.dishId,
              );
              // Not a good method:
              // Navigator.of(context).push(
              //   MaterialPageRoute(
              //     builder: (ctx) => DishDetailScreen(),
              //   ),
              // );
            },
          ),
          const Text("6793"),
          const SizedBox(height: 16),

          // Like Section

          IconButton(
            onPressed: () {
              // TODO: Replace 'u1' to current user's userId
              post.toggleLikeStatus('u1');
              _likeStatus = post.postLike.containsKey('u1');
              print(_likeStatus);
            },
            // TODO: Replace 'u1' to current user's userId
            icon: Consumer<Post>(
              builder: (context, value, child) => Icon(
                // Temp
                _likeStatus ? Icons.favorite : Icons.favorite_border,
                size: 24,
                color: _likeStatus ? red2Color : neutral1Color,
              ),
            ),
          ),

          // Display amount of likes
          Text('123'), // Temp
          // TOFIX: Firebase
          // Text("${widget.snap['likes'].length}"),
          const SizedBox(height: 16),

          // Comment Section
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.comment_outlined,
              size: 24,
            ),
          ),
          Text('12'), // Temp
          // TOFIX: Firebase
          // Text("$commentLen"),
          const SizedBox(height: 16),

          // Save Post Section
          const Icon(
            Icons.bookmark_outline,
            size: 24,
          ),
          const Text("7093"),
          const SizedBox(height: 16),

          // Share Post Section
          const Icon(
            Icons.share_outlined,
            size: 24,
          ),
          const Text("5604"),
        ],
      ),
    );
  }
}
