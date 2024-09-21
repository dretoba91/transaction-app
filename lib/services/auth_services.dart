import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:transaction_app/utils/colors.dart';
import 'package:transaction_app/utils/routes.dart';
import 'package:transaction_app/utils/size_calculator.dart';
import 'package:transaction_app/widgets/snack_bar.dart';

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
    } catch (e) {
      log('error ===> $e');
    }
  }

  // Login logic
  Future login(email, password, [context]) async {
    late final UserCredential userCredential;
    try {
      userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Navigator.pushReplacementNamed(
        context,
        RouteHelper.homePageRoute,
      );
    } on FirebaseAuthException catch (e) {
      // Handle errors
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.message!,
            style: TextStyle(
              fontSize: sizer(true, 14, context),
              fontWeight: FontWeight.w600,
              color: AppColors.textWhite,
            ),
          ),
          backgroundColor: AppColors.secondaryRedColor,
          duration: const Duration(
            seconds: 10,
          ),
        ),
      );
    }

    // return userCredential;
  }

  Future<void> sendVerifyEmailLink() async {
    try {
      await _firebaseAuth.currentUser?.sendEmailVerification();
    } catch (e) {
      log("send email verification error: ${e.toString()}");
    }
  }

  Future<void> signout() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      log("siging out error: ${e.toString()}");
    }
  }
}
