import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class UserProfileLikePostScreen extends StatelessWidget {
  const UserProfileLikePostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(0),
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 5,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1,
        crossAxisSpacing: 0,
        mainAxisSpacing: 0,
      ),
      // Individual Post
      itemBuilder: (context, index) => Container(
        width: MediaQuery.of(context).size.width / 3,
        height: MediaQuery.of(context).size.width / 3,
        child: Image.network(
          "https://images.unsplash.com/photo-1497034825429-c343d7c6a68f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8MjB8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width / 3,
          height: MediaQuery.of(context).size.width / 3,
        ),
      ),
    );
  }
}
