import 'package:cloud_firestore/cloud_firestore.dart';

class Transactions {
  final String name;
  final String type;
  final double amount;
  final String userId;
  final String id;
  final Timestamp createdAt;
  // final String? date;

  Transactions({
    required this.name,
    required this.type,
    required this.amount,
    required this.userId,
    required this.id,
    required this.createdAt,
  });

  // from Json method

  static Transactions fromJson(Map<String, dynamic> json) {
    return Transactions(
      name: json['name'],
      type: json['type'],
      amount: json['amount'],
      userId: json['userId'],
      id: json['id'],
      createdAt: json['createdAt'],
    );
  }

  // to Json method
  Map<String, dynamic> toJson() => {
        'name': name,
        'type': type,
        'amount': amount,
        'userId': userId,
        'id': id,
        'createdAt': createdAt,
      };
}
