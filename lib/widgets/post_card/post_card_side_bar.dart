import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/post.dart';
import '../../providers/user.dart';
import '../../providers/users.dart';
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
    // TODO:
    // Replace Provider with Stateful widget for the toggleLikeStatus()
    // TODO:
    // final post = Provider.of<Post>(context, listen: false);
    // TODO: Update backend of class Users
    // User user = Users().findByUserId(post.userId);

    // TODO:
    bool _dishVisitStatus = true; //post.postDishVisit.containsKey(user.userId);
    // TODO:
    bool _likeStatus = true; //post.postLike.containsKey(user.userId);
    // TODO:
    bool _saveStatus = true; //post.postSave.containsKey(user.userId);

    return Container(
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          // Food Menu Section
          // TODO: If post tagged dish, then only show this
          GestureDetector(
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

              // Store data in database
              // TODO: Fix Backend
              // post.toggleDishVisitStatus(user.userId);
              // TODO: Fix Backend
              // _dishVisitStatus = post.postDishVisit.containsKey(user.userId);
            },
            child: Column(
              children: [
                Image.asset(
                  'assets/images/icons/menu.png',
                  width: 24,
                  height: 24,
                  color: neutral1Color,
                ),
                SizedBox(height: 4),
                // Display amount of Dish Visit
                Consumer<Post>(
                  builder: (context, value, child) => Text(
                    post.postDishVisit.length.toString(), // count like
                    style: TextStyle(
                      fontSize: 12,
                      color: neutral1Color,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Like Section
          GestureDetector(
            onTap: () {
              //TODO
              //post.toggleLikeStatus(user.userId);
              //TODO
              //_likeStatus = post.postLike.containsKey(user.userId);
            },
            child: Column(
              children: [
                Consumer<Post>(
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
                SizedBox(height: 4),
                // Display amount of likes
                Consumer<Post>(
                  builder: (context, value, child) => Text(
                    post.postLike.length.toString(), // count like
                    style: TextStyle(
                      fontSize: 12,
                      color: neutral1Color,
                    ),
                  ),
                ),
                // Temp
                // TOFIX: Firebase
                // Text("${widget.snap['likes'].length}"),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Comment Section
          GestureDetector(
            onTap: () {},
            child: Column(
              children: [
                Image.asset(
                  'assets/images/icons/comment.png',
                  width: 24,
                  height: 24,
                  color: neutral1Color,
                ),
                SizedBox(height: 4),
                // Display amount of Comment
                Consumer<Post>(
                  builder: (context, value, child) => Text(
                    post.postComment.length.toString(), // count like
                    style: TextStyle(
                      fontSize: 12,
                      color: neutral1Color,
                    ),
                  ),
                ),
                // Temp
                // TOFIX: Firebase
                // Text("$commentLen"),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Save Post Section
          GestureDetector(
            onTap: () {
              //TODO
              // post.toggleSaveStatus(user.userId);
              //TODO
              //_saveStatus = post.postSave.containsKey(user.userId);
            },
            child: Column(
              children: [
                Consumer<Post>(
                  builder: (context, value, child) => Image.asset(
                    _saveStatus
                        ? 'assets/images/icons/bookmark_filled.png'
                        : 'assets/images/icons/bookmark.png',
                    width: 24,
                    height: 24,
                    color: _saveStatus ? blue2Color : neutral1Color,
                  ),
                ),
                SizedBox(height: 4),
                // Display amount of Save
                Consumer<Post>(
                  builder: (context, value, child) => Text(
                    post.postSave.length.toString(), // count like
                    style: TextStyle(
                      fontSize: 12,
                      color: neutral1Color,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Share Post Section
          GestureDetector(
            onTap: () {},
            child: Column(
              children: [
                Image.asset(
                  'assets/images/icons/share.png',
                  width: 24,
                  height: 24,
                  color: neutral1Color,
                ),
                SizedBox(height: 4),
                // Display amount of Share
                Consumer<Post>(
                  builder: (context, value, child) => Text(
                    post.postShare.length.toString(), // count like
                    style: TextStyle(
                      fontSize: 12,
                      color: neutral1Color,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
