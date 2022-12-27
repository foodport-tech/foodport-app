import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String uid;
  final String username;
  final String postId;
  final DateTime datePublished;
  final String photoUrl;
  final String review;
  final double ratingValueDelicious;
  final double ratingValueRecommend;
  final double ratingValueWorthIt;
  final String? foodMenuId;
  final likes;

  const Post({
    required this.uid,
    required this.username,
    required this.postId,
    required this.datePublished,
    required this.photoUrl,
    required this.review,
    required this.ratingValueDelicious,
    required this.ratingValueRecommend,
    required this.ratingValueWorthIt,
    this.foodMenuId,
    required this.likes,
  });

  static Post fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Post(
      uid: snapshot['uid'],
      username: snapshot['username'],
      postId: snapshot['postId'],
      datePublished: snapshot['datePublished'],
      photoUrl: snapshot['photoUrl'],
      review: snapshot['review'],
      ratingValueDelicious: snapshot['ratingValueDelicious'],
      ratingValueRecommend: snapshot['ratingValueRecommend'],
      ratingValueWorthIt: snapshot['ratingValueWorthIt'],
      foodMenuId: snapshot['foodMenuId'],
      likes: snapshot['likes'],
    );
  }

  // Convert every argument received to an object file (Json file)
  Map<String, dynamic> toJson() => {
        'uid': uid,
        'username': username,
        'postId': postId,
        'datePublished': datePublished,
        'photoUrl': photoUrl,
        'review': review,
        'ratingValueDelicious': ratingValueDelicious,
        'ratingValueRecommend': ratingValueRecommend,
        'ratingValueWorthIt': ratingValueWorthIt,
        'foodMenuId': foodMenuId,
        'likes': likes,
      };
}
