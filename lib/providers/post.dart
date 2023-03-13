import 'dart:io';
import 'package:flutter/foundation.dart';

class Post with ChangeNotifier {
  final int postId;
  String? postPhotoUrl;
  String postReview;
  double postRatingDelicious;
  double postRatingEatAgain;
  double postRatingWorthIt;
  DateTime postPublishDateTime;
  int userId;
  int? dishId;
  String? postPublishIpAddress;
  // 'Impression': A Nested Map of 'userId' and "number of times" of the users that have viewed this post
  Map? postView;
  // A Nested Map of 'userId' of the users that have liked this post
  Map? postLike;
  // A Nested Map of 'userId' & "number of times" of the users that have viewed the comments of this post
  Map? postCommentView;
  // A Map of 'userId' & 'postCommentId' of the users that have commented this post
  Map? postComment;
  // A Map of 'userId' & 'postShareId' of the users that have shared this post
  Map? postShare;
  // A Map of 'userId' & 'postSaveId' of the users that have saved this post
  Map? postSave;
  // A Map of 'userId' & 'postDishViewId' of the users that have viewed the dish of this post
  Map? postDishVisit;
  // A Map of 'userId' & 'postDishSellerVisitId' of the users that have visited the seller profile of this post
  Map? postDishSellerVisit;

  Post({
    required this.postId,
    required this.postPhotoUrl,
    required this.postReview,
    required this.postRatingDelicious,
    required this.postRatingEatAgain,
    required this.postRatingWorthIt,
    required this.postPublishDateTime,
    required this.userId,
    required this.postPublishIpAddress,
    this.postView,
    this.postLike,
    this.postCommentView,
    this.postComment,
    this.postShare,
    this.postSave,
    this.postDishVisit,
    this.postDishSellerVisit,
    this.dishId,
  });

  // toggleDishVisitStatus(userId) {
  //   // If 'postDishVisit' contain 'userId':
  //   if (postLike.containsKey(userId)) {
  //     // Add Value to Key 'userId'
  //     // TODO: Code goes here
  //   }
  //   // Else ('postDishVisit' not contain 'userId'):
  //   else {
  //     // Add Key 'userId' to 'postDishVisit'
  //     postDishVisit.putIfAbsent("$userId", () => []);
  //     // Add Value to Key 'userId'
  //     // TODO: Code goes here
  //   }

  //   notifyListeners();
  // }

  // toggleLikeStatus(userId) {
  //   // If 'postLike' contain 'userId':
  //   if (postLike.containsKey(userId)) {
  //     // Remove 'userId' from 'postLike'
  //     postLike.remove(userId);
  //   }
  //   // Else ('postLike' not contain 'userId'):
  //   else {
  //     // Add 'userId' to 'postLike'
  //     postLike.putIfAbsent("$userId", () => []);
  //     // Add Value to Key 'userId'
  //     // TODO: Code goes here
  //   }

  //   notifyListeners();
  // }

  // toggleSaveStatus(userId) {
  //   // If 'postSave' contain 'userId':
  //   if (postSave.containsKey(userId)) {
  //     // Remove 'userId' from 'postLike'
  //     postSave.remove(userId);
  //   }
  //   // Else ('postSave' not contain 'userId'):
  //   else {
  //     // Add 'userId' to 'postSave'
  //     postSave.putIfAbsent("$userId", () => []);
  //     // Add Value to Key 'userId'
  //     // TODO: Code goes here
  //   }

  //   notifyListeners();
  // }
}
