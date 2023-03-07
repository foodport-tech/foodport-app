import 'dart:io';
import 'dart:convert';
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

import '../utils/api_links.dart';
import 'post.dart';

class Posts with ChangeNotifier {
  String? _authToken;
  // Data Source - Post Content
  List<Post> _items = [
    // Post(
    //   postId: 'p1',
    //   postPhoto:
    //       "https://ucarecdn.com/134fe764-10be-4ab5-ae45-40876bb63289/-/crop/2230x1254/0,1139/-/resize/1600x900/",
    //   postReview:
    //       'It was absolutely delicious! The chicken katsu was crispy and juicy, and the ebi sambal added a nice spicy kick. The truffled eggs were a unique and decadent addition, and the cucumber provided a refreshing contrast. The pandan loaf was a great finishing touch, adding a subtle sweetness and a lovely aroma. Overall, it was a perfect combination of flavors and textures, and I would highly recommend it to anyone looking for a tasty and satisfying meal.',
    //   postRatingEatAgain: 4.0,
    //   postRatingDelicious: 3.0, //postRatingStar: 3.0,
    //   postRatingWorthIt: 5.0,
    //   postPublishDateTime: DateTime(2022, 12, 25),
    //   userId: 'u3',
    //   dishId: 'd1',
    //   postPublishIpAddress: '',
    //   postView: {
    //     'u1': ['pv1'], // post view ID
    //     'u2': [],
    //   },
    //   postLike: {
    //     'u1': ['pl1'], // post like ID
    //     'u2': [],
    //   },
    //   postCommentView: {
    //     'u1': ['pcv1'], // post comment view ID
    //     'u2': [],
    //   },
    //   postComment: {
    //     'u1': ['pc1'], // post comment ID
    //     'u2': [],
    //   },
    //   postSave: {
    //     'u1': ['psv1'], // post save ID
    //     'u2': [],
    //   },
    //   postShare: {
    //     'u1': ['psh1'], // post share ID
    //     'u2': [],
    //   },
    //   postDishVisit: {
    //     'u1': ['pdv1'], // post menu visit ID
    //     'u2': [],
    //   },
    //   postDishSellerVisit: {
    //     'u1': ['pdsv1'], // post menu seller vist ID
    //     'u2': [],
    //   },
    // ),
    // Post(
    //   postId: 'p2',
    //   postPhotoUrl:
    //       "https://ucarecdn.com/377af099-49ad-4032-b8d1-b4b831496bb8/-/crop/2528x1422/0,1005/-/resize/1600x900/",
    //   postReview: 'The cheese is delicious.',
    //   postRatingEatAgain: 3.0,
    //   postRatingDelicious: 4.0,
    //   postRatingWorthIt: 4.0,
    //   postPublishDateTime: DateTime(2022, 11, 30),
    //   userId: 'u4',
    //   dishId: 'd2',
    //   postPublishIpAddress: '',
    //   postView: {
    //     'u1': [],
    //     'u2': [],
    //   },
    //   postLike: {
    //     'u2': [],
    //   },
    //   postCommentView: {
    //     'u1': [],
    //     'u2': [],
    //   },
    //   postComment: {
    //     'u1': [],
    //     'u2': [],
    //   },
    //   postShare: {
    //     'u1': [],
    //     'u2': [],
    //   },
    //   postSave: {
    //     'u1': [],
    //     'u2': [],
    //   },
    //   postDishVisit: {
    //     'u1': [],
    //     'u2': [],
    //   },
    //   postDishSellerVisit: {
    //     'u1': [],
    //     'u2': [],
    //   },
    // ),
  ];

  // Constructor
  Posts(this._authToken, this._items);

  String returnAuthToken() {
    return _authToken!;
  }

  // BACKEND INTERACTION
  // Fetch postItems from Backend
  Future<void> fetchPostsFromBackend() async {
    final url = Uri.http(ApiLinks.baseUrl, ApiLinks.posts);
    try {
      final response = await http.get(
        url,
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "Authorization": "Token $_authToken",
        },
      );

      final extractedData = json.decode(response.body) as Map<String, dynamic>;

      if (extractedData == null) {
        return;
      }

      final List<Post> loadedPosts = [];

      extractedData.forEach(
        (postId, postData) {
          loadedPosts.add(
            Post(
              postId: postId,
              postPhotoUrl: postData['postPhotoUrl'],
              postReview: postData['postReview'],
              postRatingEatAgain: postData['postRatingEatAgain'],
              postRatingDelicious: postData['postRatingDelicious'],
              postRatingWorthIt: postData['postRatingWorthIt'],
              postPublishDateTime: postData['postPublishDateTime'],
              userId: postData['userId'],
              dishId: postData['dishId'],
              postPublishIpAddress: postData['postPublishIpAddress'],
              postView: postData['postView'],
              postLike: postData['postLike'],
              postCommentView: postData['postCommentView'],
              postComment: postData['postComment'],
              postSave: postData['postSave'],
              postShare: postData['postShare'],
              postDishVisit: postData['postDishVisit'],
              postDishSellerVisit: postData['postDishSellerVisit'],
            ),
          );
        },
      );

      _items = loadedPosts;

      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }

  Future<String> uploadImage(String postId, Uint8List imageData) async {
    final url = Uri.http(ApiLinks.baseUrl, ApiLinks.uploadImage);

    // Create multipart request
    var request = http.MultipartRequest('POST', url);

    // Add post ID field to request body
    request.fields['postId'] = postId;

    // Add image file to request
    var imageFile = http.MultipartFile.fromBytes('image', imageData);
    request.files.add(imageFile);

    try {
      // Send request and handle response
      var response = await request.send();
      if (response.statusCode == 200) {
        var responseJson = await response.stream.bytesToString();
        print('Image uploaded successfully!');
        return responseJson;
      } else {
        var responseJson = response.reasonPhrase;
        print('Error uploading image: ${response.reasonPhrase}');
        return responseJson;
      }
    } catch (error) {
      print('Error uploading image: $error');
      throw error;
    }
  }

  // BACKEND INTERACTION
  Future<void> publishPostToBackend(Post post, Uint8List imageFile) async {
    print("PUBLISH POST TO BACKEND - authToken: $_authToken");

    final url = Uri.http(ApiLinks.baseUrl, ApiLinks.posts);

    try {
      // POST class Post
      final response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "Authorization": "Token $_authToken",
        },
        body: json.encode({
          'postId': post.postId,
          'postPhotoUrl': post.postPhotoUrl,
          'postReview': post.postReview,
          'postRatingDelicious': post.postRatingDelicious,
          'postRatingEatAgain': post.postRatingEatAgain,
          'postRatingWorthIt': post.postRatingWorthIt,
          'postPublishDateTime': post.postPublishDateTime.toIso8601String(),
          'userId': post.userId,
          'dishId': post.dishId,
          'postPublishIpAddress': post.postPublishIpAddress,
          'postView': post.postView,
          'postLike': post.postLike,
          'postCommentView': post.postCommentView,
          'postComment': post.postComment,
          'postShare': post.postShare,
          'postSave': post.postSave,
          'postDishVisit': post.postDishVisit,
          'postDishSellerVisit': post.postDishSellerVisit,
        }),
      );

      print("PUBLISH POST TO BACKEND - authToken: $_authToken");
      print(
          "PUBLISH POST TO BACKEND - response: ${json.decode(response.body)}");

      String postId = json.decode(response.body)['postId'];

      // Upload Image to server
      final uploadImageResponse = await uploadImage(postId, imageFile);

      if (uploadImageResponse != null) {
        // Create new class Post from response
        final newPost = Post(
          postId: json.decode(response.body)['postId'],
          postPhotoUrl: json.decode(uploadImageResponse)['postPhotoUrl'],
          postReview: post.postReview,
          postRatingEatAgain: post.postRatingEatAgain,
          postRatingDelicious: post.postRatingDelicious,
          postRatingWorthIt: post.postRatingWorthIt,
          postPublishDateTime: post.postPublishDateTime,
          userId: post.userId,
          dishId: post.dishId,
          postPublishIpAddress: post.postPublishIpAddress,
          postView: post.postView,
          postLike: post.postLike,
          postCommentView: post.postCommentView,
          postComment: post.postComment,
          postSave: post.postSave,
          postShare: post.postShare,
          postDishVisit: post.postDishVisit,
          postDishSellerVisit: post.postDishSellerVisit,
        );

        // Insert new post at the start of the list
        _items.insert(0, newPost);

        notifyListeners();
      }
    } catch (error) {
      print(error);
      throw error;
    }
  }

  // FRONTEND INTERACTION
  // For Screen widget: To Get postItems from _items
  List<Post> get postItems {
    // Return a copy by using '[...]'
    // Reference: https://www.udemy.com/course/learn-flutter-dart-to-build-ios-android-apps/learn/lecture/15100258#overview
    return [..._items];
  }

  // For Screen widget: To Get postItems from _items
  // Provide posts that the author are followed by the user
  List<Post> get followingPostItems {
    // Return a copy by using '[...]'
    // Reference: https://www.udemy.com/course/learn-flutter-dart-to-build-ios-android-apps/learn/lecture/15100258#overview
    return [..._items];
  }

// For Screen widget: To Get postItems from _items
  // Provide posts that are posted nearby to the user's location
  List<Post> get nearbyPostItems {
    // Return a copy by using '[...]'
    // Reference: https://www.udemy.com/course/learn-flutter-dart-to-build-ios-android-apps/learn/lecture/15100258#overview
    return [..._items];
  }

// For Screen widget: To Get postItems from _items
  // Provide posts that are recommended from algorithm
  List<Post> get forYouPostItems {
    // Return a copy by using '[...]'
    // Reference: https://www.udemy.com/course/learn-flutter-dart-to-build-ios-android-apps/learn/lecture/15100258#overview
    return [..._items];
  }

  Post findByPostId(String postId) {
    return _items.firstWhere((post) => post.postId == postId);
  }
}
