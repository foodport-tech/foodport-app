class Post {
  final String postId;
  final String postPhotoUrl;
  final String postReview;
  final double postRatingStar;
  final double postRatingRecommend;
  final double postRatingWorthIt;
  final DateTime postPublishDateTime;
  final postLike;
  final postComment;
  final postShare;
  final postSave;
  String? dishId;

  Post({
    required this.postId,
    required this.postPhotoUrl,
    required this.postReview,
    required this.postRatingStar,
    required this.postRatingRecommend,
    required this.postRatingWorthIt,
    required this.postPublishDateTime,
    this.postLike,
    this.postComment,
    this.postShare,
    this.postSave,
    this.dishId,
  });
}
