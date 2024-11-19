import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:transaction_app/models/types.dart';

class Transactions extends Equatable {
  final String name;
  final Types type;
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

  factory Transactions.fromJson(Map<dynamic, dynamic> json) {
    return Transactions(
      name: json['name'],
      type: Types.fromJson(json['type']),
      amount: json['amount'] is double
          ? json['amount']
          : double.parse(json['amount']),
      userId: json['userId'],
      id: json['id'],
      createdAt: json['createdAt'],
    );
  }

  // to Json method
  Map<String, dynamic> toJson() => {
        'name': name,
        'type': type.toJson(),
        'amount': amount.toString(),
        'userId': userId,
        'id': id,
        'createdAt': createdAt,
      };

  // CopyWith method

  Transactions copyWith(
      {String? name,
      Types? type,
      double? amount,
      String? userId,
      Timestamp? createdAt}) {
    return Transactions(
        name: name ?? this.name,
        type: type ?? this.type,
        amount: amount ?? this.amount,
        userId: userId ?? this.userId,
        id: id,
        createdAt: createdAt ?? this.createdAt);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        name,
        type,
        amount,
        userId,
        id,
        createdAt,
      ];

  @override
  bool get stringify => true;
}
