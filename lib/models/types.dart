import 'package:transaction_app/models/transaction_model.dart';

enum Types {
  Income,
  Expense;

  String toJson() => name;

  static Types fromJson(String json) => values.byName(json);
}

extension TypesX on Types {
  String get toName => switch (this) {
        Types.Income => 'Income',
        Types.Expense => 'Expense',
      };

  bool apply(Transactions? transaction) => switch (this) {
        Types.Income => transaction?.type == Types.Income,
        Types.Expense => transaction?.type == Types.Expense,
      };

  Iterable<Transactions?> applyAll(Iterable<Transactions?> expenses) {
    return expenses.where(apply);
  }
}
