import 'dart:developer';

import 'package:flutter/material.dart';

class ApiException implements Exception {
  final String message;
  final String? code;

  ApiException(this.message, {this.code});

  static void show(BuildContext context, String code,
      {String message = 'Error!!'}) {
    log("==> calling show dialog");
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(message),
        content: Text(_mapErrorCodeToMessage(code)),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  static String _mapErrorCodeToMessage(String code) {
    log("==> calling map Error");
    switch (code) {
      case 'invalid-email':
        return "The email address is badly formatted.";
      case 'user-not-found':
        return "No user found with this email.";
      case 'invalid-credential':
        return "credential is incorrect";
      default:
        return "An unknown error occurred.";
    }
  }

  @override
  String toString() {
    return 'CustomApiException: $message${code != null ? ' (Code: $code)' : ''}';
  }
}
