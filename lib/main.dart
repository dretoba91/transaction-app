import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:transaction_app/firebase_options.dart';
import 'package:transaction_app/screens/home_page.dart';
import 'package:transaction_app/screens/authentication/login_page.dart';
import 'package:transaction_app/screens/authentication/signup_page.dart';
import 'package:transaction_app/screens/splash.dart';
import 'package:transaction_app/utils/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Transaction App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Splash(),
      onGenerateRoute: RouteHelper().generateRoute,
    );
  }
}
