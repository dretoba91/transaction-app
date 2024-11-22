import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:transaction_app/data/services/api_exception.dart';
import 'package:transaction_app/utils/routes.dart';

class AuthService {
  AuthService._();
  static final AuthService instance = AuthService._();

  final _firebaseAuth = FirebaseAuth.instance;

  // getter method

  Stream<User?> get authStateChange => _firebaseAuth.authStateChanges();

  // Authentication Methods

  Future<void> signUpUser({
    required email,
    required password,
    required name,
  }) async {
    log('calling sign up');
    try {
      log('===> validation passed!!!!');
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // creating User collection
      User user = userCredential.user!;
      user.updateDisplayName(name);
    } on FirebaseAuthException catch (e) {
      throw ApiException("${e.message}", code: e.code);
    }
  }

  // Login logic
  Future login(
    email,
    password,
  ) async {
    // late final UserCredential userCredential;
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      
    } on FirebaseAuthException catch (e) {
      throw ApiException("${e.message}", code: e.code);
      // Handle errors
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(
      //     content: Text(
      //       e.message!,
      //       style: TextStyle(
      //         fontSize: sizer(true, 14, context),
      //         fontWeight: FontWeight.w600,
      //         color: AppColors.textWhite,
      //       ),
      //     ),
      //     backgroundColor: AppColors.secondaryRedColor,
      //     duration: const Duration(
      //       seconds: 10,
      //     ),
      //   ),
      // );
    }

    // return userCredential;
  }

  Future<void> sendVerifyEmailLink() async {
    try {
      await _firebaseAuth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw ApiException("${e.message}", code: e.code);
    }
  }

  Future<void> signout() async {
    try {
      await _firebaseAuth.signOut();
    } on FirebaseAuthException catch (e) {
      throw ApiException("${e.message}", code: e.code);
    }
  }

  // Checking User Auth state

  Future<bool> checkUserAuthState() async {
    final isLoggedIn = _firebaseAuth.currentUser != null;
    log("**is it currentUser: $isLoggedIn");
    return isLoggedIn;
  }
}
