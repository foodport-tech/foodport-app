import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:image_picker/image_picker.dart';

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
  Uint8List? _file;
  late String postPhotoUrl;
  // Controller for Review Field
  final TextEditingController _reviewController = TextEditingController();
  String _ratingDescriptionDelicious = 'Moderately';
  String _ratingDescriptionEatAgain = 'Moderately';
  String _ratingDescriptionWorthIt = 'Moderately';
  var _newPost = Post(
    postId: '',
    postPhotoUrl: '',
    postReview: '',
    postRatingDelicious: 3,
    postRatingEatAgain: 3,
    postRatingWorthIt: 3,
    postPublishDateTime: DateTime.now(),
    userId: '',
    postPublishIpAddress: '',
    postView: '',
    postLike: '',
    postCommentView: '',
    postComment: '',
    postShare: '',
    postSave: '',
    postDishVisit: '',
    postDishSellerVisit: '',
    dishId: '',
  );
  // Form
  final _form = GlobalKey<FormState>();
  // For publishPost()
  Posts posts = Posts(null, []);

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
                Uint8List file = await pickImage(ImageSource.camera);

                postPhotoUrl = getPhotoUrl(file);

                setState(() {
                  _newPost.postPhotoUrl = postPhotoUrl;
                });
              },
            ),
            // Option 2: Choose from device gallery
            SimpleDialogOption(
              padding: const EdgeInsets.all(20),
              child: const Text("Choose from gallery"),
              onPressed: () async {
                Navigator.of(context).pop();
                Uint8List file = await pickImage(ImageSource.gallery);

                setState(() {
                  _file = file;
                });
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

  getPhotoUrl(Uint8List file) {
    String photoUrl;
    photoUrl = "";

    return photoUrl;
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
    if (_file != null) {
      _newPost.postReview = _reviewController.text;

      // Call function createPost
      posts.publishPostToBackend(_newPost);

      // Reset Review, Photo, Rating, Dish ID

      print("FUNCTION CALLED: posts.publishPost");
    } else {
      print("FUNCTION NOT CALLED: posts.publishPost");
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
                        child: _file == null
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
                                    image: MemoryImage(_file!),
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
                    _newPost.dishId = 'd2';
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
