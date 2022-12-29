import 'package:flutter/material.dart';

import 'post.dart';

class Posts with ChangeNotifier {
  // Data Source - Post Content
  List<Post> _items = [
    Post(
      postId: 'p1',
      postPhotoUrl:
          'https://media.istockphoto.com/id/1309352410/photo/cheeseburger-with-tomato-and-lettuce-on-wooden-board.jpg?s=612x612&w=0&k=20&c=lfsA0dHDMQdam2M1yvva0_RXfjAyp4gyLtx4YUJmXgg=',
      postReview: 'This food is good.',
      postRatingRecommend: 4.0,
      postRatingStar: 3.0,
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
          'https://media.istockphoto.com/id/1309352410/photo/cheeseburger-with-tomato-and-lettuce-on-wooden-board.jpg?s=612x612&w=0&k=20&c=lfsA0dHDMQdam2M1yvva0_RXfjAyp4gyLtx4YUJmXgg=',
      postReview: 'The cheese is delicious.',
      postRatingRecommend: 3.0,
      postRatingStar: 4.0,
      postRatingWorthIt: 4.0,
      postPublishDateTime: DateTime(2022, 11, 30),
      userId: 'u4',
      dishId: null,
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
