import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:foodport_app/providers/auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:path/path.dart' as path;

import '../../providers/post.dart';
import '../../providers/posts.dart';
import '../../utils/colors.dart';
import '../../utils/utils.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({super.key});

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  // Post's Image file
  Uint8List? _imageFile;
  String? _imageFileName;
  String? _postPhotoUrl;
  // Controller for Review Field
  final TextEditingController _reviewController = TextEditingController();
  String _ratingDescriptionDelicious = 'Moderately';
  String _ratingDescriptionEatAgain = 'Moderately';
  String _ratingDescriptionWorthIt = 'Moderately';
  var _newPost = Post(
    postId: 0,
    postPhotoUrl: null,
    postReview: '',
    postRatingDelicious: 3,
    postRatingEatAgain: 3,
    postRatingWorthIt: 3,
    postPublishDateTime: DateTime.now(),
    // TODO: Get appropriate UserId
    userId: 0,
    postPublishIpAddress: '',
    postView: '',
    postLike: '',
    postCommentView: '',
    postComment: '',
    postShare: '',
    postSave: '',
    postDishVisit: '',
    postDishSellerVisit: '',
    dishId: null,
  );
  // Form
  final _form = GlobalKey<FormState>();

  _selectImage(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: const Text('Create a Post'),
          children: [
            // Option 1: Take a photo using device camera
            SimpleDialogOption(
              padding: const EdgeInsets.all(20),
              child: const Text("Take a photo"),
              onPressed: () async {
                Navigator.of(context).pop();
                Map<String, dynamic> imageData =
                    await pickImage(ImageSource.camera);
                _imageFile = imageData['imageBytes'];
                _imageFileName = imageData['fileName'];
              },
            ),
            // Option 2: Choose from device gallery
            SimpleDialogOption(
              padding: const EdgeInsets.all(20),
              child: const Text("Choose from gallery"),
              onPressed: () async {
                Navigator.of(context).pop();
                Map<String, dynamic> imageData =
                    await pickImage(ImageSource.camera);
                _imageFile = imageData['imageBytes'];
                _imageFileName = imageData['fileName'];
              },
            ),
            // Option 3: Cancel
            SimpleDialogOption(
              padding: const EdgeInsets.all(20),
              child: const Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  _getRatingDescription(double ratingValue) {
    if (ratingValue == 1.0) {
      return 'Not at all';
    } else if (ratingValue == 2.0) {
      return 'Slightly';
    } else if (ratingValue == 3.0) {
      return 'Moderately';
    } else if (ratingValue == 4.0) {
      return 'Very';
    } else if (ratingValue == 5.0) {
      return 'Extremely';
    }
  }

  // TODO: WORKING IN PROGRESS
  void _publishPost() {
    // If there is an image
    if (_imageFile != null) {
      _newPost.postReview = _reviewController.text;
      _newPost.postPublishDateTime = DateTime.now();
      _newPost.userId = Provider.of<Auth>(context, listen: false).userId!;

      // Call function createPost
      Provider.of<Posts>(context, listen: false)
          .publishPostToBackend(_newPost, _imageFile!, _imageFileName!);

      print("FUNCTION CALLED: posts.publishPost");
      print("_newPost.postId: ${_newPost.postId}");
      print("_newPost.postPhoto: ${_newPost.postPhotoUrl}");
      print("_newPost.postReview: ${_newPost.postReview}");
      print("_newPost.postRatingDelicious: ${_newPost.postRatingDelicious}");
      print("_newPost.postRatingEatAgain: ${_newPost.postRatingEatAgain}");
      print("_newPost.postRatingWorthIt: ${_newPost.postRatingWorthIt}");
      print(
          "_newPost.postPublishDateTime: ${_newPost.postPublishDateTime.toIso8601String()}");
      print("_newPost.userId: ${_newPost.userId}");
      print("_newPost.dishId: ${_newPost.dishId}");
      print("_newPost.postPublishIpAddress: ${_newPost.postPublishIpAddress}");
      print("_newPost.postView: ${_newPost.postView}");
      print("_newPost.postLike: ${_newPost.postLike}");
      print("_newPost.postCommentView: ${_newPost.postCommentView}");
      print("_newPost.postComment: ${_newPost.postComment}");
      print("_newPost.postShare: ${_newPost.postShare}");
      print("_newPost.postSave: ${_newPost.postSave}");
      print("_newPost.postDishVisit: ${_newPost.postDishVisit}");
      print("_newPost.postDishSellerVisit: ${_newPost.postDishSellerVisit}");

      // Call function upload Image

      setState(() {
        // Reset Review, Photo, Rating, Dish ID
        _imageFile = null;
        _newPost.postPhotoUrl = '';
        _reviewController.text = '';
        _newPost.postReview = '';
        _newPost.postRatingDelicious = 3;
        _newPost.postRatingEatAgain = 3;
        _newPost.postRatingWorthIt = 3;
        _newPost.dishId = null;
      });
    } else {
      print("FUNCTION NOT CALLED: posts.publishPost");
      print("_newPost.postId: ${_newPost.postId}");
      print("_newPost.postPhotoUrl: ${_newPost.postPhotoUrl}");
      print("_newPost.postReview: ${_newPost.postReview}");
      print("_newPost.postRatingDelicious: ${_newPost.postRatingDelicious}");
      print("_newPost.postRatingEatAgain: ${_newPost.postRatingEatAgain}");
      print("_newPost.postRatingWorthIt: ${_newPost.postRatingWorthIt}");
      print(
          "_newPost.postPublishDateTime: ${_newPost.postPublishDateTime.toIso8601String()}");
      print("_newPost.userId: ${_newPost.userId}");
      print("_newPost.dishId: ${_newPost.dishId}");
      print("_newPost.postPublishIpAddress: ${_newPost.postPublishIpAddress}");
      print("_newPost.postView: ${_newPost.postView}");
      print("_newPost.postLike: ${_newPost.postLike}");
      print("_newPost.postCommentView: ${_newPost.postCommentView}");
      print("_newPost.postComment: ${_newPost.postComment}");
      print("_newPost.postShare: ${_newPost.postShare}");
      print("_newPost.postSave: ${_newPost.postSave}");
      print("_newPost.postDishVisit: ${_newPost.postDishVisit}");
      print("_newPost.postDishSellerVisit: ${_newPost.postDishSellerVisit}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        elevation: 0, // Remove shadow
        title: const Text(
          "Create Post",
          style: TextStyle(
            color: neutral1Color,
          ),
        ),
      ),
      backgroundColor: mobileBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Row(
                    children: [
                      // WRITE REVIEW: For user to write review
                      Expanded(
                        child: TextField(
                          controller: _reviewController,
                          decoration: const InputDecoration(
                            hintText: "Write your thoughts..",
                            border: InputBorder.none,
                          ),
                          style: const TextStyle(
                            fontSize: 16,
                            color: neutral3Color,
                          ),
                          maxLines: 5,
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),

                      // UPLOAD PHOTO: For user to upload a dish photo
                      Container(
                        color: Colors.white,
                        width: 100,
                        height: 100,
                        child: _imageFile == null
                            ? IconButton(
                                icon: const Icon(
                                  Icons.add_photo_alternate_outlined,
                                ),
                                // Direct user to take a photo or select a file
                                onPressed: () => _selectImage(context),
                              )
                            : Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    // '!' in '_fill!' means variable will never be null
                                    image: MemoryImage(_imageFile!),
                                    fit: BoxFit.fill,
                                    alignment: FractionalOffset.topCenter,
                                  ),
                                ),
                              ),
                      ),
                    ],
                  ),
                  const Divider(thickness: 1.5),
                  const SizedBox(height: 12),

                  // Rating: Delicious
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.25,
                        child: const Text(
                          "Delicious",
                          style: TextStyle(
                            fontSize: 14,
                            color: neutral1Color,
                          ),
                        ),
                      ),
                      Expanded(
                        child: RatingBar.builder(
                          initialRating: 3,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: false,
                          itemCount: 5,
                          itemSize: 24,
                          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => Image.asset(
                            'assets/images/icons/star_filled.png',
                          ),
                          onRatingUpdate: (rating) {
                            setState(() {
                              _newPost.postRatingDelicious = rating;
                              _ratingDescriptionDelicious =
                                  _getRatingDescription(rating);
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.2,
                        child: Text(
                          _ratingDescriptionDelicious,
                          style: const TextStyle(
                            fontSize: 14,
                            color: neutral1Color,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  // Rating: Eat Again
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.25,
                        child: const Text(
                          "Eat Again",
                          style: TextStyle(
                            fontSize: 14,
                            color: neutral1Color,
                          ),
                        ),
                      ),
                      Expanded(
                        child: RatingBar.builder(
                          initialRating: 3,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: false,
                          itemCount: 5,
                          itemSize: 24,
                          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => Image.asset(
                            'assets/images/icons/fire_filled.png',
                          ),
                          onRatingUpdate: (rating) {
                            setState(() {
                              _newPost.postRatingEatAgain = rating;
                              _ratingDescriptionEatAgain =
                                  _getRatingDescription(rating);
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.2,
                        child: Text(
                          _ratingDescriptionEatAgain,
                          style: const TextStyle(
                            fontSize: 14,
                            color: neutral1Color,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  // Rating: Worth It
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.25,
                        child: const Text(
                          "Worth It",
                          style: TextStyle(
                            fontSize: 14,
                            color: neutral1Color,
                          ),
                        ),
                      ),
                      Expanded(
                        child: RatingBar.builder(
                          initialRating: 3,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: false,
                          itemCount: 5,
                          itemSize: 24,
                          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => Image.asset(
                            'assets/images/icons/coin_filled.png',
                          ),
                          onRatingUpdate: (rating) {
                            setState(() {
                              _newPost.postRatingWorthIt = rating;
                              _ratingDescriptionWorthIt =
                                  _getRatingDescription(rating);
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.2,
                        child: Text(
                          _ratingDescriptionWorthIt,
                          style: const TextStyle(
                            fontSize: 14,
                            color: neutral1Color,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Divider(thickness: 1.5),
                ],
              ),
            ),
            Column(
              children: [
                // Link Food
                TextButton(
                  onPressed: () {
                    // TODO: Change to selected DishID
                    _newPost.dishId = 0;
                  },
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(neutral1Color),
                    padding:
                        MaterialStateProperty.all(const EdgeInsets.all(16)),
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/icons/cutlery.png',
                        width: 20,
                        height: 20,
                      ),
                      SizedBox(width: 16),
                      Expanded(child: Text("What do you eat?")),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: neutral3Color,
                      ),
                    ],
                  ),
                ),
                // Setting: Posting Privacy
                TextButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(neutral1Color),
                    padding:
                        MaterialStateProperty.all(const EdgeInsets.all(16)),
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/icons/unlock.png',
                        width: 20,
                        height: 20,
                      ),
                      SizedBox(width: 16),
                      Expanded(child: Text("Public · Everyone can view")),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: neutral3Color,
                      ),
                    ],
                  ),
                ),
                // Advance Setting
                TextButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(neutral1Color),
                    padding:
                        MaterialStateProperty.all(const EdgeInsets.all(16)),
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/icons/setting.png',
                        width: 20,
                        height: 20,
                      ),
                      SizedBox(width: 16),
                      Expanded(child: Text("Advance setting")),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: neutral3Color,
                      ),
                    ],
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: const Divider(thickness: 1.5),
            ),
            const SizedBox(height: 16),
            // Bottom Buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(neutral5Color),
                          elevation: MaterialStateProperty.all<double>(0),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          padding: MaterialStateProperty.all(
                            const EdgeInsets.all(14),
                          ),
                        ),
                        child: const Text(
                          'Save as draft',
                          style: TextStyle(
                            fontSize: 16,
                            color: neutral1Color,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: _publishPost,
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(primaryColor),
                          elevation: MaterialStateProperty.all<double>(0),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.all(14)),
                        ),
                        child: const Text(
                          'Publish',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
