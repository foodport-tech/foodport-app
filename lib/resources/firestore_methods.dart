import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

import '../models/post_ig.dart';
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

  // Like post in Feed Post Screen
  Future<void> likePost(String postId, String uid, List likes) async {
    try {
      // Situation: Already liked
      if (likes.contains(uid)) {
        // Remove user's 'uid' from 'likes'
        await _firestore.collection('posts').doc(postId).update({
          'likes': FieldValue.arrayRemove([uid]),
        });
      } else {
        // Add user's 'uid' into 'likes'
        await _firestore.collection('posts').doc(postId).update({
          'likes': FieldValue.arrayUnion([uid]),
        });
      }
    } catch (e) {
      print(e.toString());
    }
  }

  // Double tap image to like post in Feed Post Screen
  Future<void> doubleTapLikePost(String postId, String uid, List likes) async {
    try {
      // Situation: Already liked
      if (likes.contains(uid)) {
        // Nothing happens
      } else {
        // Add user's 'uid' into 'likes'
        await _firestore.collection('posts').doc(postId).update({
          'likes': FieldValue.arrayUnion([uid]),
        });
      }
    } catch (e) {
      print(e.toString());
    }
  }

  // Post comment in Feed Post Screen
  Future<String> postComment(
    String uid, // 'uid' Commentor's user ID
    String name, // 'name' Commentor's name
    String profilePic, // 'profilePic' Commentor's profile picture
    String postId, // 'widget.postId' Post ID
    String comment, // 'commentEditingController.text' Commentor's comment
  ) async {
    String res = "Some error occurred";
    try {
      if (comment.isNotEmpty) {
        // if the likes list contains the user uid, we need to remove it
        String commentId = const Uuid().v1();
        _firestore
            .collection('posts')
            .doc(postId)
            .collection('comments')
            .doc(commentId)
            .set({
          'profilePic': profilePic,
          'name': name,
          'uid': uid,
          'comment': comment,
          'commentId': commentId,
          'datePublished': DateTime.now(),
        });
        res = 'success';
      } else {
        res = "Please enter text";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  // Delete Post
  Future<String> deletePost(String postId) async {
    String res = "Some error occurred";
    try {
      await _firestore.collection('posts').doc(postId).delete();
      res = 'success';
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  // Follow User
  Future<void> followUser(String uid, String followId) async {
    try {
      DocumentSnapshot snap =
          await _firestore.collection('users').doc(uid).get();
      List following = (snap.data()! as dynamic)['following'];

      if (following.contains(followId)) {
        await _firestore.collection('users').doc(followId).update({
          'followers': FieldValue.arrayRemove([uid])
        });

        await _firestore.collection('users').doc(uid).update({
          'following': FieldValue.arrayRemove([followId])
        });
      } else {
        await _firestore.collection('users').doc(followId).update({
          'followers': FieldValue.arrayUnion([uid])
        });

        await _firestore.collection('users').doc(uid).update({
          'following': FieldValue.arrayUnion([followId])
        });
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
