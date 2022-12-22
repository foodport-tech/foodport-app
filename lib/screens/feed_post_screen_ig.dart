import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodport_app/utils/colors.dart';

import '../widgets/post_card_ig.dart';

class FeedPostScreenIG extends StatelessWidget {
  const FeedPostScreenIG({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        centerTitle: false,
        title: SvgPicture.asset(
          'assets/images/foodport_text_logo.svg',
          color: orange1Color,
          height: 32,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.messenger_outline,
              color: neutral1Color,
            ),
          ),
        ],
      ),
      body: const PostCardIG(),
    );
  }
}
