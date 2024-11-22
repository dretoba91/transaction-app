import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:transaction_app/data/services/api_exception.dart';
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

  Future createTransaction(Transactions transacts, String id) async {
    final transactionRef = _firebaseDb.collection('Transactions').doc(id);
    final transactions = transacts;
    try {
      final transact = transactions.toJson();
      if (transact.values.isNotEmpty) {
        transactionRef.set(transact);
      }
    } on FirebaseException catch (e) {
      throw ApiException("${e.message}");
      // snackBarHandler(
      //   context: context,
      //   message: e.message!,
      // );
    }
  }

  // Read Method
  /*
    * use the get method to read from the firestore.
    * convert the Json data using the fromJson method in the Transaction model class
   */

  /// Returns a Stream of List<Transactions>
  Stream<List<Transactions>> getTransactions(String userId) {
    return _firebaseDb
        .collection('Transactions')
        .where('userId', isEqualTo: userId)
        .snapshots() // Listen to real-time updates
        .map((snapshot) => snapshot.docs
            .map((doc) => Transactions.fromJson(doc.data()))
            .toList());
  }

  // Update Method

  Future updateTransaction(Transactions transacts, String id) async {
    final transactionRef = _firebaseDb.collection('Transactions').doc(id);
    final transactions = transacts;
    try {
      final transact = transactions.toJson();
      if (transact.values.isNotEmpty) {
        transactionRef.update(transact);
      }
    } on FirebaseException catch (e) {
      throw ApiException(e.code);
    }
  }

  // Delete Method
}
