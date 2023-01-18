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
      itemCount: 10,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1,
        crossAxisSpacing: 0,
        mainAxisSpacing: 0,
      ),
      // Individual Post
      itemBuilder: (context, index) => Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(16.0),
          ),
          boxShadow: [
            BoxShadow(
              color: neutral5Color,
              spreadRadius: 0,
              blurRadius: 16,
              offset: Offset(0, 4),
            ),
          ],
        ),
      ),
    );
  }
}
