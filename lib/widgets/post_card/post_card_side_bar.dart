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
          GestureDetector(
            child: Image.asset(
              'assets/images/icons/menu.png',
              width: 24,
              height: 24,
              color: neutral1Color,
            ),
            onTap: () {
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
          SizedBox(height: 4),
          const Text(
            "6793",
            style: TextStyle(
              fontSize: 12,
              color: neutral1Color,
            ),
          ),
          const SizedBox(height: 16),

          // Like Section

          GestureDetector(
            onTap: () {
              // TODO: Replace 'u1' to current user's userId
              post.toggleLikeStatus('u1');
              _likeStatus = post.postLike.containsKey('u1');
              print(_likeStatus);
            },
            child: Consumer<Post>(
              builder: (context, value, child) => Image.asset(
                // Temp
                _likeStatus
                    ? 'assets/images/icons/love_filled.png'
                    : 'assets/images/icons/love.png',
                width: 24,
                height: 24,
                color: _likeStatus ? red2Color : neutral1Color,
              ),
            ),
          ),
          SizedBox(height: 4),
          // Display amount of likes
          Text(
            '123',
            style: TextStyle(
              fontSize: 12,
              color: neutral1Color,
            ),
          ), // Temp
          // TOFIX: Firebase
          // Text("${widget.snap['likes'].length}"),
          const SizedBox(height: 16),

          // Comment Section
          Image.asset(
            'assets/images/icons/comment.png',
            width: 24,
            height: 24,
            color: neutral1Color,
          ),
          SizedBox(height: 4),
          Text(
            '12',
            style: TextStyle(
              fontSize: 12,
              color: neutral1Color,
            ),
          ), // Temp
          // TOFIX: Firebase
          // Text("$commentLen"),
          const SizedBox(height: 16),

          // Save Post Section
          Image.asset(
            'assets/images/icons/bookmark.png',
            width: 24,
            height: 24,
            color: neutral1Color,
          ),
          SizedBox(height: 4),
          const Text(
            "7093",
            style: TextStyle(
              fontSize: 12,
              color: neutral1Color,
            ),
          ),
          const SizedBox(height: 16),

          // Share Post Section
          Image.asset(
            'assets/images/icons/share.png',
            width: 24,
            height: 24,
            color: neutral1Color,
          ),
          SizedBox(height: 4),
          const Text(
            "5604",
            style: TextStyle(
              fontSize: 12,
              color: neutral1Color,
            ),
          ),
        ],
      ),
    );
  }
}
