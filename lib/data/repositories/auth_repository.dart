import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:transaction_app/data/services/auth_services.dart';
import 'package:transaction_app/data/services/api_exception.dart';

class AuthRepository {
  final AuthService _authService;

  AuthRepository({required AuthService authService})
      : _authService = authService;

  /// Stream to listen for authentication state changes
  Stream<User?> get authStateChange => _authService.authStateChange;

  /// Signs up a new user with email, password, and name
  Future<void> signUpUser({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      await _authService.signUpUser(
        email: email,
        password: password,
        name: name,
      );
    } on ApiException catch (e) {
      log("Sign up failed: ${e.message}, Code: ${e.code}");
      rethrow; // Pass the exception to be handled by the UI layer
    }
  }

  /// Logs in a user with email and password
  Future<void> login(String email, String password, context) async {
    try {
      await _authService.login(email, password);
    } on ApiException catch (e) {
      log("Login failed: ${e.message}, Code: ${e.code}");
      rethrow; // Pass the exception to be handled by the UI layer
    } catch (e) {
      log("Unexpected error in Repository: $e");
      throw ApiException("An unexpected error occurred.");
    }
  }

  /// Sends a verification email to the current user
  Future<void> sendVerifyEmailLink() async {
    try {
      await _authService.sendVerifyEmailLink();
    } catch (e) {
      log("Error sending verification email: ${e.toString()}");
      throw ApiException("Failed to send verification email.");
    }
  }

  /// Signs out the currently logged-in user
  Future<void> signout() async {
    try {
      await _authService.signout();
    } catch (e) {
      log("Signout failed: ${e.toString()}");
      throw ApiException("Failed to sign out.");
    }
  }

  /// Checks if the user is logged in
  Future<bool> checkUserAuthState() async {
    try {
      return await _authService.checkUserAuthState();
    } catch (e) {
      log("Error checking auth state: ${e.toString()}");
      throw ApiException("Failed to check user authentication state.");
    }
  }
}
