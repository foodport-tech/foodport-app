import 'package:flutter/material.dart';

import 'user.dart';

class Users with ChangeNotifier {
  // Data Source - Dish Content
  List<User> _items = [
    User(
      userId: 'u1',
      userUsername: 'jeremychong',
      userPhoneNumber: '+60127588511',
      userEmailAddress: 'h09083.cys@gmail.com',
      userPassword: 'Jeremy1234',
      userName: 'Jeremy Chong',
      userBio: 'Macha & Cheese lover',
      userProfilePictureURL:
          'https://media.istockphoto.com/id/936928380/photo/portrait-of-a-mid-adult-male.jpg?s=612x612&w=0&k=20&c=U_nnHIwP61jYJvRhjCdOjrye4CPlcOCmKmHKXefoiPg=',
      userBirthDate: DateTime.utc(2002, 2, 20),
      userAccountRegisterDate: DateTime.utc(2002, 2, 20, 12, 51),
      userIPAddress: '14.192.213.110',
      postId: ['p1', 'p3'],
      userPostView: ['pv2', 'pv4'],
      userPostLike: ['pl2', 'pl4'],
      userPostCommentView: ['pcv1'],
      userPostComment: {
        'p2': ['pc1', 'pc2'], // comment ID
        'p4': ['pc3'],
      },
      userPostSave: ['psv2', 'psv4'],
      userPostShare: ['psh2', 'psh4'],
      userPostDishVisit: ['pdv1', 'pdv2'],
      userPostDishSellerVisit: ['pdsv1', 'pdsv2'],
    ),
    User(
      userId: 'u2',
      userUsername: 'benjaminlim',
      userPhoneNumber: '+60127588511',
      userEmailAddress: 'h09083.cys@gmail.com',
      userPassword: 'Benjamin1234',
      userName: 'Benjamin Lim',
      userBio: 'Desserts lover',
      userProfilePictureURL:
          'https://media.istockphoto.com/id/936928380/photo/portrait-of-a-mid-adult-male.jpg?s=612x612&w=0&k=20&c=U_nnHIwP61jYJvRhjCdOjrye4CPlcOCmKmHKXefoiPg=',
      userBirthDate: DateTime.utc(2002, 2, 20),
      userAccountRegisterDate: DateTime.utc(2002, 2, 20, 12, 51),
      userIPAddress: '14.192.213.110',
      postId: ['p1', 'p3'],
      userPostView: ['pv2', 'pv4'],
      userPostLike: ['pl2', 'pl4'],
      userPostCommentView: ['pcv1'],
      userPostComment: {
        'p2': ['pc1', 'pc2'], // comment ID
        'p4': ['pc3'],
      },
      userPostSave: ['psv2', 'psv4'],
      userPostShare: ['psh2', 'psh4'],
      userPostDishVisit: ['pdv1', 'pdv2'],
      userPostDishSellerVisit: ['pdsv1', 'pdsv2'],
    ),
    User(
      userId: 'u3',
      userUsername: 'calvinteo',
      userPhoneNumber: '+60127588511',
      userEmailAddress: 'h09083.cys@gmail.com',
      userPassword: 'Calvin1234',
      userName: 'Calvin Teo',
      userBio: 'Macha & Cheese lover',
      userProfilePictureURL:
          'https://media.istockphoto.com/id/936928380/photo/portrait-of-a-mid-adult-male.jpg?s=612x612&w=0&k=20&c=U_nnHIwP61jYJvRhjCdOjrye4CPlcOCmKmHKXefoiPg=',
      userBirthDate: DateTime.utc(2002, 2, 20),
      userAccountRegisterDate: DateTime.utc(2002, 2, 20, 12, 51),
      userIPAddress: '14.192.213.110',
      postId: ['p1', 'p3'],
      userPostView: ['pv2', 'pv4'],
      userPostLike: ['pl2', 'pl4'],
      userPostCommentView: ['pcv1'],
      userPostComment: {
        'p2': ['pc1', 'pc2'], // comment ID
        'p4': ['pc3'],
      },
      userPostSave: ['psv2', 'psv4'],
      userPostShare: ['psh2', 'psh4'],
      userPostDishVisit: ['pdv1', 'pdv2'],
      userPostDishSellerVisit: ['pdsv1', 'pdsv2'],
    ),
    User(
      userId: 'u4',
      userUsername: 'derektan',
      userPhoneNumber: '+60127588511',
      userEmailAddress: 'h09083.cys@gmail.com',
      userPassword: 'Calvin1234',
      userName: 'Derek Tan',
      userBio: 'Macha & Cheese lover',
      userProfilePictureURL:
          'https://media.istockphoto.com/id/936928380/photo/portrait-of-a-mid-adult-male.jpg?s=612x612&w=0&k=20&c=U_nnHIwP61jYJvRhjCdOjrye4CPlcOCmKmHKXefoiPg=',
      userBirthDate: DateTime.utc(2002, 2, 20),
      userAccountRegisterDate: DateTime.utc(2002, 2, 20, 12, 51),
      userIPAddress: '14.192.213.110',
      postId: ['p1', 'p3'],
      userPostView: ['pv2', 'pv4'],
      userPostLike: ['pl2', 'pl4'],
      userPostCommentView: ['pcv1'],
      userPostComment: {
        'p2': ['pc1', 'pc2'], // comment ID
        'p4': ['pc3'],
      },
      userPostSave: ['psv2', 'psv4'],
      userPostShare: ['psh2', 'psh4'],
      userPostDishVisit: ['pdv1', 'pdv2'],
      userPostDishSellerVisit: ['pdsv1', 'pdsv2'],
    ),
  ];

  List<User> get userItems {
    // Return a copy by using '[...]'
    // Reference: https://www.udemy.com/course/learn-flutter-dart-to-build-ios-android-apps/learn/lecture/15100258#overview
    return [..._items];
  }

  User findByUserId(String userId) {
    return _items.firstWhere((user) => user.userId == userId);
  }
}
