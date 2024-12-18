import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:transaction_app/data/services/api.dart';
import 'package:transaction_app/data/services/api_exception.dart';
import 'package:transaction_app/models/transaction_model.dart';
import 'package:transaction_app/models/types.dart';

class TransactionRepository {
  final ApiService apiService;

  TransactionRepository({required this.apiService});

  // Get all Transaction

  /// Calls Api.getTransactions and provides a Stream of List<Transactions>
  Stream<List<Transactions>> readTransactions(String userId) {
    return apiService.getTransactions(userId);
  }

  // Add Transaction

  Future addTransaction(
    String name,
    double amount,
    Types type,
    String userId,
    BuildContext context,
  ) async {
    final transactionId = getId();
    try {
      Transactions transact = Transactions(
        name: name,
        type: type,
        amount: amount,
        userId: userId,
        id: transactionId,
        createdAt: Timestamp.now(),
      );

      await apiService.createTransaction(transact, transactionId);
    } on ApiException catch (e) {
      rethrow;
      // log("Transaction Error: ${e.message}");
      // if (context.mounted) {
      //   ApiException.show(
      //       context, e.code ?? "unknown-error"); // Use context safely
      // }
    }
  }

  // Update Transaction

  Future updateTransaction(
    String name,
    double amount,
    Types type,
    String userId,
    String id,
    BuildContext context,
  ) async {
    try {
      Transactions transact = Transactions(
        name: name,
        type: type,
        amount: amount,
        userId: userId,
        id: id,
        createdAt: Timestamp.now(),
      );
      await apiService.updateTransaction(transact, id);
    } on ApiException catch (e) {
      rethrow;
      // log("Update Transaction Error: ${e.message}");
      // // Display the error dialog
      // if (context.mounted) {
      //   ApiException.show(
      //       context, e.code ?? "unknown-error"); // Use context safely
      // }
    }
  }

  // create a unique ID for the for each post by using Time Stamp.

  String getId() {
    final timeNow = DateTime.now();
    String timeStamp = DateFormat('yyyyMMddHHmmss').format(timeNow);
    return timeStamp;
  }

  // Coverting date time string to a formatted date (MM, dd)

  String formatedDateTime(Timestamp dateTime) {
    final format = DateFormat('d MMM y');
    return format.format(dateTime.toDate());
  }

  // void showErrorSnackbar(String message) {
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(
  //       content: Text(message),
  //       duration: Duration(seconds: 3),
  //     ),
  //   );
  // }
}
