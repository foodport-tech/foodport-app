import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class UserProfileAllPostScreen extends StatelessWidget {
  const UserProfileAllPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(0),
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 11,
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
          "https://images.unsplash.com/photo-1546069901-ba9599a7e63c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80",
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width / 3,
          height: MediaQuery.of(context).size.width / 3,
        ),
      ),
    );
  }
}
