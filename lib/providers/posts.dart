import 'package:flutter/material.dart';

import 'post.dart';

class Posts with ChangeNotifier {
  // Data Source - Post Content
  List<Post> _items = [
    Post(
      postId: 'p1',
      postPhotoUrl:
          "https://ucarecdn.com/134fe764-10be-4ab5-ae45-40876bb63289/-/crop/2230x1254/0,1139/-/resize/1600x900/",
      postReview: 'This food is good.',
      postRatingEatAgain: 4.0,
      postRatingDelicious: 3.0, //postRatingStar: 3.0,
      postRatingWorthIt: 5.0,
      postPublishDateTime: DateTime(2022, 12, 25),
      userId: 'u3',
      dishId: 'd1',
      postPublishIpAddress: '',
      postView: {
        'u1': [],
        'u2': [],
      },
      postLike: {
        'u1': [],
        'u2': [],
      },
      postCommentView: {
        'u1': [],
        'u2': [],
      },
      postComment: {
        'u1': [],
        'u2': [],
      },
      postShare: {
        'u1': [],
        'u2': [],
      },
      postSave: {
        'u1': [],
        'u2': [],
      },
      postMenuVisit: {
        'u1': [],
        'u2': [],
      },
      postMenuSellerVisit: {
        'u1': [],
        'u2': [],
      },
    ),
    Post(
      postId: 'p2',
      postPhotoUrl:
          "https://ucarecdn.com/377af099-49ad-4032-b8d1-b4b831496bb8/-/crop/2528x1422/0,1005/-/resize/1600x900/",
      postReview: 'The cheese is delicious.',
      postRatingEatAgain: 3.0,
      postRatingDelicious: 4.0,
      postRatingWorthIt: 4.0,
      postPublishDateTime: DateTime(2022, 11, 30),
      userId: 'u4',
      dishId: 'd2',
      postPublishIpAddress: '',
      postView: {
        'u1': [],
        'u2': [],
      },
      postLike: {
        'u2': [],
      },
      postCommentView: {
        'u1': [],
        'u2': [],
      },
      postComment: {
        'u1': [],
        'u2': [],
      },
      postShare: {
        'u1': [],
        'u2': [],
      },
      postSave: {
        'u1': [],
        'u2': [],
      },
      postMenuVisit: {
        'u1': [],
        'u2': [],
      },
      postMenuSellerVisit: {
        'u1': [],
        'u2': [],
      },
    ),
  ];

  List<Post> get postItems {
    // Return a copy by using '[...]'
    // Reference: https://www.udemy.com/course/learn-flutter-dart-to-build-ios-android-apps/learn/lecture/15100258#overview
    return [..._items];
  }

  // Provide posts that the author are followed by the user
  List<Post> get followingPostItems {
    // Return a copy by using '[...]'
    // Reference: https://www.udemy.com/course/learn-flutter-dart-to-build-ios-android-apps/learn/lecture/15100258#overview
    return [..._items];
  }

  // Provide posts that are posted nearby to the user's location
  List<Post> get nearbyPostItems {
    // Return a copy by using '[...]'
    // Reference: https://www.udemy.com/course/learn-flutter-dart-to-build-ios-android-apps/learn/lecture/15100258#overview
    return [..._items];
  }

  // Provide posts that are recommended from algorithm
  List<Post> get forYouPostItems {
    // Return a copy by using '[...]'
    // Reference: https://www.udemy.com/course/learn-flutter-dart-to-build-ios-android-apps/learn/lecture/15100258#overview
    return [..._items];
  }

  Post findByPostId(String postId) {
    return _items.firstWhere((post) => post.postId == postId);
  }

  void createPost() {
    notifyListeners();
  }
}
