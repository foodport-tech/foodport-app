import 'package:flutter/foundation.dart';

class User with ChangeNotifier {
  final int userId;
  String? userUsername;
  String? userPhoneNumber;
  String? userEmailAddress;
  String? userPassword;
  String? userName;
  String? userBio;
  String? userProfilePictureUrl;
  DateTime? userBirthDate;
  DateTime? userAccountRegisterDate;
  String? userIPAddress;
  // Post that generated by the user
  // ['postId', 'postId']
  List? userPostId;
  // {'postId': ['postLikeId', 'postLikeId']}
  Map<String, dynamic>? userPostLike;
  // {'postId': ['postCommentId', 'postCommentId']}
  Map<String, dynamic>? userPostComment;
  // {'postId': ['postSaveId', 'postSaveId']}
  Map<String, dynamic>? userPostSave;
  // {'postId': ['postShareId', 'postShareId']}
  Map<String, dynamic>? userPostShare;
  // {'postId': ['postViewId', 'postViewId']}
  Map<String, dynamic>? userPostView;
  // {'postId': ['postCommentViewId', 'postCommentViewId']}
  Map<String, dynamic>? userPostCommentView;
  // {'postId': ['postDishVisitId', 'postDishVisitId']}
  Map<String, dynamic>? userPostDishVisit;
  // {'postId': ['postDishSellerVisitId', 'postDishSellerVisitId']}
  Map<String, dynamic>? userPostDishSellerVisit;

  User({
    required this.userId,
    this.userUsername,
    this.userPhoneNumber,
    this.userEmailAddress,
    this.userPassword,
    this.userName,
    this.userBio,
    this.userProfilePictureUrl,
    this.userBirthDate,
    this.userAccountRegisterDate,
    this.userPostId,
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
