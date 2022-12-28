import 'package:flutter/material.dart';

import '../models/post.dart';

class Posts with ChangeNotifier {
  // Data Source - Post Content
  List<Post> _items = [
    Post(
        postId: 'p1',
        postPhotoUrl:
            'https://media.istockphoto.com/id/1309352410/photo/cheeseburger-with-tomato-and-lettuce-on-wooden-board.jpg?s=612x612&w=0&k=20&c=lfsA0dHDMQdam2M1yvva0_RXfjAyp4gyLtx4YUJmXgg=',
        postPublishDateTime: DateTime(2022, 12, 25),
        postRatingRecommend: 4.0,
        postRatingStar: 3.0,
        postRatingWorthIt: 5.0,
        postReview: 'This food is good.',
        userId: 'u3',
        dishId: 'd1'),
    Post(
      postId: 'p2',
      postPhotoUrl:
          'https://media.istockphoto.com/id/1309352410/photo/cheeseburger-with-tomato-and-lettuce-on-wooden-board.jpg?s=612x612&w=0&k=20&c=lfsA0dHDMQdam2M1yvva0_RXfjAyp4gyLtx4YUJmXgg=',
      postPublishDateTime: DateTime(2022, 11, 30),
      postRatingRecommend: 3.0,
      postRatingStar: 4.0,
      postRatingWorthIt: 4.0,
      postReview: 'The cheese is delicious.',
      userId: 'u4',
      dishId: null,
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

  Post findByDishId(String dishId) {
    return _items.firstWhere((post) => post.dishId == dishId);
  }

  void createPost() {
    notifyListeners();
  }
}
