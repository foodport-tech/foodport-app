import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

pickImage(ImageSource source) async {
  final ImagePicker _imagePicker = ImagePicker();

  XFile? _file = await _imagePicker.pickImage(source: source);

  // If there is something in the _file
  if (_file != null) {
    List<int> imageBytes =
        await _file.readAsBytes(); // await because it returns Future
    String fileName = _file.name;
    return {'imageBytes': imageBytes, 'fileName': fileName};
  }

  print("No image selected");
}

showSnackBar(String content, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(content),
    ),
  );
}
