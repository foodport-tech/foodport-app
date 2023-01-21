import 'package:flutter/foundation.dart';

class User with ChangeNotifier {
  final String userId;
  final String? userUsername;
  final String? userPhoneNumber;
  final String? userEmailAddress;
  final userPassword;
  final userName;
  final userBio;
  final userProfilePictureURL;
  final DateTime? userBirthDate;
  final DateTime? userAccountRegisterDate;
  final userIPAddress;
  final postId;
  final userPostLike;
  final userPostComment;
  final userPostSave;
  final userPostShare;
  final userPostView;
  final userPostCommentView;
  final userPostDishVisit;
  final userPostDishSellerVisit;
  User({
    required this.userId,
    this.userUsername,
    this.userPhoneNumber,
    this.userEmailAddress,
    this.userPassword,
    this.userName,
    this.userBio,
    this.userProfilePictureURL,
    this.userBirthDate,
    this.userAccountRegisterDate,
    this.postId,
    this.userPostLike,
    this.userPostComment,
    this.userPostSave,
    this.userPostShare,
    this.userPostView,
    this.userPostCommentView,
    this.userPostDishVisit,
    this.userPostDishSellerVisit,
    this.userIPAddress,
  });
}
