class Transaction {
  final String name;
  final String type;
  final double amount;

  Transaction({
    required this.name,
    required this.type,
    required this.amount,
  });

  // from Json method

  static Transaction fromJson(Map<String, dynamic> json) {
    return Transaction(
      name: json['name'],
      type: json['type'],
      amount: json['amount'],
    );
  }

  // to Json method
  Map<String, dynamic> toJson() => {
        'name': name,
        'type': type,
        'amount': amount,
      };
}
