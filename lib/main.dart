

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transaction_app/data/services/api.dart';
import 'package:transaction_app/data/transaction_repository.dart';
import 'package:transaction_app/firebase_options.dart';
import 'package:transaction_app/screens/splash.dart';
import 'package:transaction_app/utils/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final transactRepository =
      TransactionRepository(apiService: ApiService.instance);
  runApp(MyApp(
    transactRepository: transactRepository,
  ));
}

class MyApp extends StatelessWidget {
  final TransactionRepository transactRepository;
  const MyApp({super.key, required this.transactRepository});

  

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: transactRepository,
      child: MaterialApp(
        title: 'Transaction App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const Splash(),
        onGenerateRoute: RouteHelper().generateRoute,
      ),
    );
  }
}
