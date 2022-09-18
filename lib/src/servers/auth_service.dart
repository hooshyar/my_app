import 'dart:ffi';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';

class AuthService {
  //todo
  //write a methode to authenticate user using firebase auth
  Future<UserCredential?> createUserWithEmailAndPassword(
      {required String email, password}) async {
    UserCredential? credential;
    try {
      credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        showSnakbar('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        showSnakbar('The account already exists for that email.');
      } else if (e.code == 'invalid-email') {
        showSnakbar('The email address is badly formatted.');
      } else {
        print(e);
        showSnakbar(e.message.toString());
      }
    } catch (error) {
      showSnakbar(error.toString());
    }
    return credential;
  }

  Future<UserCredential?> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    UserCredential? credential;
    try {
      credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        showSnakbar('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        showSnakbar('Wrong password provided for that user.');
      } else if (e.code == 'unknown') {
        print('Given String is empty or null.');
        showSnakbar('Given String is empty or null.');
      } else if (e.code == 'invalid-email') {
        print('The email address is badly formatted.');
        showSnakbar('The email address is badly formatted.');
      } else {
        print(e);
        showSnakbar(e.code);
      }
    }
    return credential;
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  showSnakbar(String message) {
    Get.snackbar(
      'Error',
      message,
    );
    print('snsckbar');
  }
}
