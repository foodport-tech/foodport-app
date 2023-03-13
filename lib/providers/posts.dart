import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../utils/api_links.dart';
import 'post.dart';

class Posts with ChangeNotifier {
  String? _authToken;
  List<Post> _items = [];

  // Constructor
  Posts(this._authToken, this._items);

  String returnAuthToken() {
    return _authToken!;
  }

  void updateToken(String? token) {
    _authToken = token;
  }

  // BACKEND INTERACTION
  // Fetch postItem(s) from Backend
  Future<Post> fetchSinglePostFromBackend({required int postId}) async {
    print("//posts.dart - fetchPostsFromBackend() - _authToken: ${_authToken}");

    final url = Uri.http(ApiLinks.baseUrl, '${ApiLinks.posts}/$postId');

    try {
      final response = await http.get(
        url,
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "Authorization": "Token $_authToken",
        },
      );

      print(
          "//posts.dart - fetchPostsFromBackend() - response.body: ${response.body}");

      final extractedData = json.decode(response.body) as dynamic;

      print(
          "//posts.dart - fetchPostsFromBackend() - extractedData: ${extractedData}");

      return _parsePost(extractedData);
    } catch (error) {
      throw (error);
    }
  }

  Future<void> fetchAllPostsFromBackend() async {
    print("//posts.dart - fetchPostsFromBackend() - _authToken: ${_authToken}");

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

      print(
          "//posts.dart - fetchPostsFromBackend() - response.body: ${response.body}");

      final extractedData = json.decode(response.body) as dynamic;

      print(
          "//posts.dart - fetchPostsFromBackend() - extractedData: ${extractedData}");

      if (extractedData == null) {
        return;
      }

      extractedData.forEach(
        (postData) {
          final Post post = _parsePost(postData);
          _items.add(post);
        },
      );

      print("//posts.dart - fetchPostsFromBackend() - _items: ${_items}");

      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }

  Post _parsePost(dynamic postData) {
    return Post(
      postId: postData['postId'],
      postPhotoUrl: postData['postPhotoUrl'],
      postReview: postData['postReview'],
      postRatingEatAgain: postData['postRatingEatAgain'],
      postRatingDelicious: postData['postRatingDelicious'],
      postRatingWorthIt: postData['postRatingWorthIt'],
      postPublishDateTime: DateTime.parse(
        postData['postPublishDateTime'],
      ).toLocal(),
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
    );
  }

  Future<String?> uploadImage(
      int postId, Uint8List imageData, String imageFileName) async {
    final url = Uri.http(
      ApiLinks.baseUrl,
      ApiLinks.uploadImage.replaceAll('{id}', postId.toString()),
    );

    print("//posts.dart - uploadImage - postId: $postId");

    // Create multipart request
    var request = http.MultipartRequest('POST', url);

    // Add image file to request
    var imageFile = http.MultipartFile.fromBytes(
      'postPhotoUrl',
      imageData,
      filename: imageFileName,
    );
    request.files.add(imageFile);

    try {
      // Add headers to the request
      request.headers.addAll({'Authorization': 'Token $_authToken'});

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
  Future<void> publishPostToBackend(
    Post post,
    Uint8List imageFile,
    String imageFileName,
  ) async {
    print("//posts.dart - publishPostToBackend - authToken: $_authToken");

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

      print("//posts.dart - publishPostToBackend - authToken: $_authToken");
      print(
          "//posts.dart - publishPostToBackend - response: ${json.decode(response.body)}");

      int postId = json.decode(response.body)['postId'];

      // Upload Image to server
      final uploadImageResponse =
          await uploadImage(postId, imageFile, imageFileName);

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
