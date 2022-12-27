import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../resources/storage_methods.dart';
import '../models/user_ig.dart' as model;

class AuthMethods {
  // Get an instance of FirebaseAuth class,
  // so can call multiple functions (e.g. createUserWithEmailAndPassword())
  // from the FirebaseAuth class
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Get user detail
  Future<model.User> getUserDetails() async {
    User currentUser = _auth.currentUser!;

    DocumentSnapshot snap =
        await _firestore.collection('users').doc(currentUser.uid).get();

    return model.User.fromSnap(snap);
  }

  // Sign Up User
  Future<String> signupUser({
    required String email,
    required String password,
    required String username,
  }) async {
    String res = "Some error occured";

    try {
      // Check if any of the input is empty
      if (email.isNotEmpty || password.isNotEmpty || username.isNotEmpty) {
        // Register User
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        print(cred.user!.uid);

        model.User user = model.User(
          uid: cred.user!.uid,
          email: email,
          username: username,
          bio: '',
          photoUrl: '',
          follower: [],
          following: [],
        );

        // Add User to Database
        // 'user!' got a '!', as it can return a null 'User?'
        // .doc(cred.user!.uid) means create a document with the 'document id' = 'user!.uid' (user id)
        await _firestore
            .collection('users')
            .doc(cred.user!.uid)
            .set(user.toJson());

        res = "success";
      }
      // } on FirebaseAuthException catch (err) {
      //   if (err.code == 'invalid-email') {
      //     res = "The email is badly formatted.";
      //   } else if (err.code == 'weak-password') {
      //     res = "Password should be at least 6 characters";
      //   }
    } catch (err) {
      res = err.toString();
    }

    return res;
  }

  // Login User
  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = "Some error occured";

    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );

        res = 'success';
      } else {
        res = "Please enter all the fields";
      }
      // } on FirebaseAuthException catch (err) {
      //   if (err.code == 'wrong-password') {
      //     res = "The password is incorrect.";
      //   } else if (err.code == 'weak-password') {
      //     res = "Password should be at least 6 characters";
      //   }
    } catch (err) {
      res = err.toString();
    }

    return res;
  }

  // Sign Out
  Future<void> signOut() async {
    await _auth.signOut();
  }
}
