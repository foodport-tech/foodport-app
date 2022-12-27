import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:foodport_app/widgets/post_card.dart';

import '../utils/colors.dart';

class FeedPostScreen extends StatelessWidget {
  const FeedPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        elevation: 0, // Remove shadow
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(
            Icons.add,
            color: neutral1Color,
          ),
          onPressed: () {},
        ),
        title: Row(
          children: [
            Text(
              'Nearby',
              style: TextStyle(color: neutral1Color),
            ),
            SizedBox(
              width: 16,
            ),
            Text(
              'Following',
              style: TextStyle(color: primaryColor),
            ),
            SizedBox(
              width: 16,
            ),
            Text(
              'For You',
              style: TextStyle(color: neutral1Color),
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search,
              color: neutral1Color,
            ),
            tooltip: 'Open shopping cart',
            onPressed: () {
              // handle the press
            },
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
          return PageView.builder(
            // To list the Amount of posts Available in Database,
            // or else will display infinity amount of posts
            scrollDirection: Axis.vertical,
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) => PostCard(
              // 'index' Means for each item in the database
              snap: snapshot.data!.docs[index].data(),
            ),
          );
        },
      ),
    );
  }
}
