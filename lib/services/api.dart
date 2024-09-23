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
        createdAt: Timestamp.now()
    );

    try {
      final transact = transactions.toJson();
      if (transact.values.isNotEmpty) {
        transactionRef.set(transact);
      }
    } on FirebaseException catch (e) {
      snackBarHandler(
        context: context,
        message: e.message!,
      );
    }
  }

  // Read Method
  /*
    * use the get method to read from the firestore.
    * convert the Json data using the fromJson method in the Transaction model class
   */

  Future<List<Transactions>> getTransactions(
      String userId, BuildContext context) async {
    // late final  transactions;
    final transactions = await _firebaseDb
          .collection('Transactions')
          .where('userId', isEqualTo: userId)
          .get();
    return transactions.docs
        .map(
          (doc) => Transactions.fromJson(doc.data()),
        )
        .toList();
    // try {

    // } on FirebaseException catch (e) {
    //   snackBarHandler(
    //     context: context,
    //     message: e.message!,
    //   );
    // }
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

  String formatedDateTime(Timestamp dateTime) {
    final format = DateFormat('d MMM y');
    return format.format(dateTime.toDate());
  }
}
