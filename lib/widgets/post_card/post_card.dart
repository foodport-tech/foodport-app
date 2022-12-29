import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/dishes.dart';
import '../../providers/post.dart';
import '../../utils/colors.dart';
import '../like_animation.dart';
import 'post_card_bottom_content.dart';

class PostCard extends StatefulWidget {
  PostCard({
    super.key,
  });

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  bool isLikeAnimating = false;
  int commentLen = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final post = Provider.of<Post>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.only(
        top: 16.0,
        bottom: 32.0,
        left: 32.0,
        right: 32.0,
      ),
      // White Background
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(16)),
          boxShadow: [
            BoxShadow(
              color: neutral5Color,
              spreadRadius: 0,
              blurRadius: 28,
              offset: Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          children: [
            // IMAGE SECTION
            GestureDetector(
              onDoubleTap: () {
                setState(() {
                  isLikeAnimating = true;
                });
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.35,
                    width: double.infinity,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(16.0),
                          topRight: Radius.circular(16.0)),
                      child: Image.network(
                        post.postPhotoUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // AnimatedOpacity(
                  //   duration: const Duration(milliseconds: 200),
                  //   opacity: isLikeAnimating ? 1 : 0,
                  //   child: LikeAnimation(
                  //     isAnimating: isLikeAnimating,
                  //     duration: const Duration(milliseconds: 400),
                  //     onEnd: () {
                  //       setState(() {
                  //         isLikeAnimating = false;
                  //       });
                  //     },
                  //     child: const Icon(
                  //       Icons.favorite,
                  //       color: red2Color,
                  //       size: 100,
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),

            //Expanded
            PostCardBottomContent(post: post),
          ],
        ),
      ),
    );
  }
}
