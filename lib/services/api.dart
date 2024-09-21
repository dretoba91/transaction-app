import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:transaction_app/models/transaction_model.dart';
import 'package:transaction_app/widgets/snack_bar.dart';

class ApiService {
  ApiService._();

  static ApiService instance = ApiService._();

  final _firebaseDb = FirebaseFirestore.instance;

  // Perform Firebase Firestore CRUD methods

  // Create Method
  /*
   * Pass all field to the method,
   * get userId for the currentUser
   * Filled the Transaction model class with necessary fields
   * convert it to a Json
   * use the "set" method from the firestore to create a collection.
   */

  Future createTransaction(String name, String type, double amount,
      String userId, BuildContext context) async {
    final transactionId = getId();
    final transactionRef =
        _firebaseDb.collection('Transactions').doc(transactionId);
    final transactions = Transactions(
      name: name,
      type: type,
      amount: amount,
      userId: userId,
      id: transactionId,
    );

    try {
      final transact = transactions.toJson();
      if (transact.values.isNotEmpty) {
        transactionRef.set(transact);
      }
    } on FirebaseException catch (e) {
      SnackBarHandler(
        message: e.toString(),
      ).show(context);
    }
  }

  // Read Method
  /*
    * use the get method to read from the firestore.
    * convert the Json data using the fromJson method in the Transaction model class
   */

  Future getTransactions(String userId, BuildContext context) async {
    try {
      final QuerySnapshot transactions = await _firebaseDb
          .collection('Transactions')
          .where('userId', isEqualTo: userId)
          .get();
      return transactions;
    } on FirebaseException catch (e) {
      SnackBarHandler(
        message: e.toString(),
        // ignore: use_build_context_synchronously
      ).show(context);
    }
  }

  // Update Method

  // Delete Method

  // create a unique ID for the for each post by using Time Stamp.

  String getId() {
    final timeNow = DateTime.now();
    String timeStamp = DateFormat('yyyyMMddHHmmss').format(timeNow);
    return timeStamp;
  }

  // Coverting date time string to a formatted date (MM, dd)

  String formatedDateTime(String dateTimeString) {
    DateTime dateTime = DateTime.parse(dateTimeString);
    String formatedDate = DateFormat('MMM dd').format(dateTime);
    return formatedDate;
  }
}
