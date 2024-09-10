import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

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
  Future<void> login({
    required email,
    required password,
  }) async {
    // late final UserCredential userCredential;
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      log("sign in error: ${e.toString()}");
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
