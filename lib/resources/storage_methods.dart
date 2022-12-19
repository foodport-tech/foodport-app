import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';

class StorageMethods {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Add Image to Firebase Storage
  Future<String> uploadImageToStorage(
    String childName,
    Uint8List file,
    bool isPost,
  ) async {
    // Create a 'ref' (path name) of where to store the file
    // '_auth.currentUser!.uid': User ID
    Reference ref =
        _storage.ref().child(childName).child(_auth.currentUser!.uid);

    // Store the file in storage
    // 'UploadTask': Can control how to upload the file
    UploadTask uploadTask = ref.putData(file);
    // Create a snapshot of the uploadTask
    TaskSnapshot snap = await uploadTask;
    // Get the URL of the location of where the file was stored
    String downloadUrl = await snap.ref.getDownloadURL();

    return downloadUrl;
  }
}
