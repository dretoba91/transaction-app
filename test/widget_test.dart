// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:transaction_app/data/repositories/auth_repository.dart';
import 'package:transaction_app/data/services/api.dart';
import 'package:transaction_app/data/repositories/transaction_repository.dart';
import 'package:transaction_app/data/services/auth_services.dart';

import 'package:transaction_app/main.dart';

void main() {
  final transactRepository =
      TransactionRepository(apiService: ApiService.instance);
  final authRepository = AuthRepository(authService: AuthService.instance);
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp(
      transactRepository: transactRepository,
      authRepository: authRepository,
    ));

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
