import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foodport_app/resources/storage_methods.dart';

class AuthMethods {
  // Get an instance of FirebaseAuth class,
  // so can call multiple functions (e.g. createUserWithEmailAndPassword())
  // from the FirebaseAuth class
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Sign Up User
  Future<String> signUpUser({
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

        // Add User to Database
        await _firestore.collection('users').doc(cred.user!.uid).set({
          // 'user!' got a '!', as it can return a null 'User?'
          // .doc(cred.user!.uid) means create a document with the 'document id' = 'user!.uid' (user id)
          'username': username,
          'uid': cred.user!.uid,
          'email': email,
          'bio': '',
          'followers': [],
          'following': [],
        });

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
}
