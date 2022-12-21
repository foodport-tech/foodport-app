import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:foodport_app/providers/user_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../models/user.dart' as model;
import '../utils/colors.dart';
import '../utils/utils.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  Uint8List? _file;
  // Controller for Review Field
  final TextEditingController _reviewController = TextEditingController();
  double _ratingValueDelicious = 3;
  double _ratingValueRecommend = 3;
  double _ratingValueWorthIt = 3;
  String _ratingDescriptionDelicious = 'Moderately';
  String _ratingDescriptionRecommend = 'Moderately';
  String _ratingDescriptionWorthIt = 'Moderately';

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

                  setState(() {
                    _file = file;
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
        });
  }

  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        elevation: 0, // Remove shadow
        // leading: IconButton(
        //   icon: const Icon(
        //     Icons.arrow_back_ios_new,
        //     color: neutral1Color,
        //   ),
        //   onPressed: () {},
        // ),
        title: const Text(
          "Create Post",
          style: TextStyle(
            color: neutral1Color,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Row(children: [
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
                    Container(
                      color: Colors.white,
                      width: 100,
                      height: 100,
                      child: _file == null
                          ? IconButton(
                              icon: const Icon(
                                  Icons.add_photo_alternate_outlined),
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
                  ]),
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
                            fontSize: 16,
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
                          itemSize: 32,
                          itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            setState(() {
                              _ratingValueDelicious = rating;
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
                            fontSize: 16,
                            color: neutral1Color,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  // Rating: Recommend
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.25,
                        child: const Text(
                          "Recommend",
                          style: TextStyle(
                            fontSize: 16,
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
                          itemSize: 32,
                          itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                          itemBuilder: (context, _) => Icon(
                            Icons.recommend,
                            color: red1Color,
                          ),
                          onRatingUpdate: (rating) {
                            setState(() {
                              _ratingValueRecommend = rating;
                              _ratingDescriptionRecommend =
                                  _getRatingDescription(rating);
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.2,
                        child: Text(
                          _ratingDescriptionRecommend,
                          style: const TextStyle(
                            fontSize: 16,
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
                            fontSize: 16,
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
                          itemSize: 32,
                          itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                          itemBuilder: (context, _) => const Icon(
                            Icons.monetization_on,
                            color: Color.fromRGBO(199, 178, 115, 1),
                          ),
                          onRatingUpdate: (rating) {
                            setState(() {
                              _ratingValueWorthIt = rating;
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
                            fontSize: 16,
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
                  onPressed: () {},
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(neutral1Color),
                    padding:
                        MaterialStateProperty.all(const EdgeInsets.all(16)),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.menu_book),
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
                      Icon(Icons.lock_open),
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
                      Icon(Icons.settings),
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
                        onPressed: () {
                          // TODO: Send data to database
                          // 'rating_delicious': _ratingValueDelicious
                          // 'rating_recommend': _ratingValueRecommend
                          // 'rating_worth_it': _ratingValueWorthIt
                          // 'food_menu_id':
                        },
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
