import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'post.dart';

class Posts with ChangeNotifier {
  // Data Source - Post Content
  List<Post> _items = [
    Post(
      postId: 'p1',
      postPhotoUrl:
          "https://ucarecdn.com/134fe764-10be-4ab5-ae45-40876bb63289/-/crop/2230x1254/0,1139/-/resize/1600x900/",
      postReview:
          'It was absolutely delicious! The chicken katsu was crispy and juicy, and the ebi sambal added a nice spicy kick. The truffled eggs were a unique and decadent addition, and the cucumber provided a refreshing contrast. The pandan loaf was a great finishing touch, adding a subtle sweetness and a lovely aroma. Overall, it was a perfect combination of flavors and textures, and I would highly recommend it to anyone looking for a tasty and satisfying meal.',
      postRatingEatAgain: 4.0,
      postRatingDelicious: 3.0, //postRatingStar: 3.0,
      postRatingWorthIt: 5.0,
      postPublishDateTime: DateTime(2022, 12, 25),
      userId: 'u3',
      dishId: 'd1',
      postPublishIpAddress: '',
      postView: {
        'u1': ['pv1'], // post view ID
        'u2': [],
      },
      postLike: {
        'u1': ['pl1'], // post like ID
        'u2': [],
      },
      postCommentView: {
        'u1': ['pcv1'], // post comment view ID
        'u2': [],
      },
      postComment: {
        'u1': ['pc1'], // post comment ID
        'u2': [],
      },
      postSave: {
        'u1': ['psv1'], // post save ID
        'u2': [],
      },
      postShare: {
        'u1': ['psh1'], // post share ID
        'u2': [],
      },
      postDishVisit: {
        'u1': ['pdv1'], // post menu visit ID
        'u2': [],
      },
      postDishSellerVisit: {
        'u1': ['pdsv1'], // post menu seller vist ID
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
      postDishVisit: {
        'u1': [],
        'u2': [],
      },
      postDishSellerVisit: {
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

  // TODO: WORKING IN PROGRESS
  void publishPost(
    Uint8List file,
    String review,
    double ratingValueDelicious,
    double ratingValueEatAgain,
    double ratingValueWorthIt,
    String newPostDishId,
  ) {
    final url = Uri.https(
        'https://foodport-app-183e3-default-rtdb.asia-southeast1.firebasedatabase.app',
        '/posts.json');
    http
        .post(
      url,
      body: json.encode({
        'postReview': review,
        'postRatingDelicious': ratingValueDelicious,
        'postRatingEatAgain': ratingValueEatAgain,
        'postRatingWorthIt': ratingValueWorthIt,
      }),
    )
        .then(
      (response) {
        notifyListeners();
      },
    );
  }
}
