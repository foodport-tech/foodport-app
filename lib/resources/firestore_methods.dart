import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

import '../models/post.dart';
import 'storage_methods.dart';

class FirestoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Publish Post
  Future<String> publishPost(
    String uid, // User's ID
    String username, // User's username
    String review, // Post's review
    Uint8List file, // Post's photo
    double ratingValueDelicious, // Post's Delicious Rating Value
    double ratingValueRecommend, // Post's Recommend Rating Value
    double ratingValueWorthIt, // Post's Worth It Rating Value
    String? foodMenuId,
  ) async {
    String res = "Some error occurred";
    try {
      // Store photo in Firebase Storage
      String photoUrl =
          await StorageMethods().uploadImageToStorage('posts', file, true);

      // Generate a unique Post ID
      String postId = const Uuid().v1();

      // Data included when user created a post
      Post post = Post(
        uid: uid,
        username: username,
        postId: postId,
        datePublished: DateTime.now(),
        photoUrl: photoUrl,
        review: review,
        ratingValueDelicious: ratingValueDelicious,
        ratingValueRecommend: ratingValueRecommend,
        ratingValueWorthIt: ratingValueWorthIt,
        foodMenuId: foodMenuId,
        likes: [],
      );

      // Store all post data in Firebase Firestore
      // .collection() to create the Folder Name
      // .doc() to create the File Name (in Folder)
      // .set(post) to create the Data (in File)
      _firestore.collection('posts').doc(postId).set(post.toJson());
      res = 'success';
    } catch (err) {
      res = err.toString();
    }

    return res;
  }
}
