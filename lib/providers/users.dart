import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../utils/api_links.dart';
import 'user.dart';

class Users with ChangeNotifier {
  String? _authToken;
  List<User> _items = [];

  // Constructor
  Users(this._authToken, this._items);

  // Allow a user to access a user's data
  Future<User> fetchSingleUserFromBackend({required int userId}) async {
    print(
        "//users.dart - fetchSingleUserFromBackend() - _authToken: ${_authToken}");
    print("//users.dart - fetchSingleUserFromBackend() - userId: ${userId}");

    final url = Uri.http(ApiLinks.baseUrl, '${ApiLinks.users}/$userId');

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
          "//users.dart - fetchSingleUserFromBackend() - response.body: ${response.body}");

      final extractedData = json.decode(response.body) as dynamic;

      print(
          "//users.dart - fetchSingleUserFromBackend() - extractedData: ${extractedData}");

      return _parseUser(extractedData);
    } catch (error) {
      throw (error);
    }
  }

  User _parseUser(dynamic userData) {
    print(
        "//users.dart - fetchSingleUserFromBackend() - userId: ${userData['userId']}");
    print(
        "//users.dart - fetchSingleUserFromBackend() - userUsername: ${userData['username']}");
    print(
        "//users.dart - fetchSingleUserFromBackend() - userPhoneNumber: ${userData['userPhoneNumber']}");
    print(
        "//users.dart - fetchSingleUserFromBackend() - userEmailAddress: ${userData['email']}");
    print(
        "//users.dart - fetchSingleUserFromBackend() - userName: ${userData['name']}");
    print(
        "//users.dart - fetchSingleUserFromBackend() - userBio: ${userData['userBio']}");
    print(
        "//users.dart - fetchSingleUserFromBackend() - userProfilePictureUrl: ${userData['userProfilePictureUrl']}");
    print(
        "//users.dart - fetchSingleUserFromBackend() - userBirthDate: ${DateTime.parse(
      userData['userBirthDate'],
    ).toLocal()}");
    print(
        "//users.dart - fetchSingleUserFromBackend() - userAccountRegisterDate: ${DateTime.parse(
      userData['userAccountRegisterDate'],
    ).toLocal()}");
    print(
        "//users.dart - fetchSingleUserFromBackend() - userIPAddress: ${userData['userIPAddress']}");
    print(
        "//users.dart - fetchSingleUserFromBackend() - userPostId: ${userData['userPostId']}");
    print(
        "//users.dart - fetchSingleUserFromBackend() - userPostLike: ${userData['userPostLike']}");
    print(
        "//users.dart - fetchSingleUserFromBackend() - userPostComment: ${userData['userPostComment']}");
    print(
        "//users.dart - fetchSingleUserFromBackend() - userPostSave: ${userData['userPostSave']}");
    print(
        "//users.dart - fetchSingleUserFromBackend() - userPostShare: ${userData['userPostShare']}");
    print(
        "//users.dart - fetchSingleUserFromBackend() - userPostView: ${userData['userPostView']}");
    print(
        "//users.dart - fetchSingleUserFromBackend() - userPostCommentView: ${userData['userPostCommentView']}");
    print(
        "//users.dart - fetchSingleUserFromBackend() - userPostDishVisit: ${userData['userPostDishVisit']}");
    print(
        "//users.dart - fetchSingleUserFromBackend() - userPostDishSellerVisit: ${userData['userPostDishSellerVisit']}");
    return User(
      userId: userData['userId'],
      userUsername: userData['username'],
      userPhoneNumber: userData['userPhoneNumber'],
      userEmailAddress: userData['email'],
      userName: userData['name'],
      userBio: userData['userBio'],
      userProfilePictureUrl: userData['userProfilePictureUrl'],
      userBirthDate: DateTime.parse(
        userData['userBirthDate'],
      ).toLocal(),
      userAccountRegisterDate: DateTime.parse(
        userData['userAccountRegisterDate'],
      ).toLocal(),
      userIPAddress: userData['userIPAddress'],
      userPostId: userData['userPostId'],
      userPostLike: userData['userPostLike'],
      userPostComment: userData['userPostComment'],
      userPostSave: userData['userPostSave'],
      userPostShare: userData['userPostShare'],
      userPostView: userData['userPostView'],
      userPostCommentView: userData['userPostCommentView'],
      userPostDishVisit: userData['userPostDishVisit'],
      userPostDishSellerVisit: userData['userPostDishSellerVisit'],
    );
    // return User(
    //   userId: userData['userId'],
    //   userUsername: userData['userUsername'],
    //   userPhoneNumber: userData['userPhoneNumber'],
    //   userEmailAddress: userData['userEmailAddress'],
    //   userName: userData['userName'],
    //   userBio: userData['userBio'],
    //   userProfilePictureUrl: userData['userProfilePictureUrl'],
    //   userBirthDate: DateTime.parse(
    //     userData['userBirthDate'],
    //   ).toLocal(),
    //   userAccountRegisterDate: DateTime.parse(
    //     userData['userAccountRegisterDate'],
    //   ).toLocal(),
    //   userIPAddress: userData['userIPAddress'],
    //   userPostId: userData['userPostId'],
    //   userPostLike: userData['userPostLike'],
    //   userPostComment: userData['userPostComment'],
    //   userPostSave: userData['userPostSave'],
    //   userPostShare: userData['userPostShare'],
    //   userPostView: userData['userPostView'],
    //   userPostCommentView: userData['userPostCommentView'],
    //   userPostDishVisit: userData['userPostDishVisit'],
    //   userPostDishSellerVisit: userData['userPostDishSellerVisit'],
    // );
  }

  List<User> get userItems {
    // Return a copy by using '[...]'
    // Reference: https://www.udemy.com/course/learn-flutter-dart-to-build-ios-android-apps/learn/lecture/15100258#overview
    return [..._items];
  }

  User findByUserId(int userId) {
    return _items.firstWhere((user) => user.userId == userId);
  }
}
