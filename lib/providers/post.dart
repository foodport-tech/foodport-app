import 'package:flutter/foundation.dart';

class Post with ChangeNotifier {
  final String postId;
  final String postPhotoUrl;
  final String postReview;
  final double postRatingStar;
  final double postRatingRecommend;
  final double postRatingWorthIt;
  final DateTime postPublishDateTime;
  final String userId;
  final postPublishIpAddress;
  // 'Impression': A Nested Map of 'userId' and "number of times" of the users that have viewed this post
  final postView;
  // A Nested Map of 'userId' of the users that have liked this post
  final postLike;
  // A Nested Map of 'userId' & "number of times" of the users that have viewed the comments of this post
  final postCommentView;
  // A Map of 'userId' & 'postCommentId' of the users that have commented this post
  final postComment;
  // A Map of 'userId' & 'postSharedId' of the users that have shared this post
  final postShare;
  // A Map of 'userId' & 'postSavedId' of the users that have saved this post
  final postSave;
  // A Map of 'userId' & 'postMenuViewedId' of the users that have viewed the menu of this post
  final postMenuVisit;
  // A Map of 'userId' & 'postMenuSellerVisitedId' of the users that have visited the seller profile of this post
  final postMenuSellerVisit;
  String? dishId;

  Post({
    required this.postId,
    required this.postPhotoUrl,
    required this.postReview,
    required this.postRatingStar,
    required this.postRatingRecommend,
    required this.postRatingWorthIt,
    required this.postPublishDateTime,
    required this.userId,
    this.postPublishIpAddress,
    this.postView,
    this.postLike,
    this.postCommentView,
    this.postComment,
    this.postShare,
    this.postSave,
    this.postMenuVisit,
    this.postMenuSellerVisit,
    this.dishId,
  });

  void toggleLikeStatus(userId) {
    // If 'postLike' contain 'userId':
    if (postView.containsKey(userId)) {
      // Remove 'userId' from 'postLike'
      postView.remove(userId);
      print("postView.remove($userId)");
      // Print the new Map result
      print("postView: $postView");
    }
    // Else ('postLike' not contain 'userId'):
    else {
      // Add 'userId' to 'postLike'
      postView.putIfAbsent("$userId", () => []);
      print("postView.putIfAbsent('$userId', () => [])");
      // Print the new Map result
      print("postView: $postView");
    }

    notifyListeners();
  }
}
