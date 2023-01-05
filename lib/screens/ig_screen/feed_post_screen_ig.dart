import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/colors.dart';
import '../../widgets/post_card/post_card_ig.dart';

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
      body: StreamBuilder(
        // To get real time data
        stream: FirebaseFirestore.instance.collection('posts').snapshots(),
        builder: (context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView.builder(
            // To list the Amount of posts Available in Database,
            // or else will display infinity amount of posts
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) => PostCardIG(
              // 'index' Means for each item in the database
              snap: snapshot.data!.docs[index].data(),
            ),
          );
        },
      ),
    );
  }
}
