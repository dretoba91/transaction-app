import 'package:flutter/material.dart';
import 'package:transaction_app/screens/add_transaction.dart';
import 'package:transaction_app/screens/authentication/login_page.dart';
import 'package:transaction_app/screens/authentication/signup_page.dart';
import 'package:transaction_app/screens/authentication/verify_page.dart';
import 'package:transaction_app/screens/home_page.dart';

class RouteHelper {
  static const String loginRoute = "LoginRoute";
  static const String signupRoute = "SignupRoute";
  static const String forgetPasswordRoute = "ForgetPasswordRoute";
  static const String verifyPageRoute = "VerifyPageRoute";
  static const String addTransactionRoute = "AddTransactionRoute";
  static const String homePageRoute = "HomepageRoute";

  static const begin = Offset(0.0, 1.0);
  static const end = Offset.zero;
  static const curve = Curves.elasticInOut;

  var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginRoute:
        return getPageRouteBuilder(
          routeName: settings.name!,
          child: const LoginPage(),
        );

      case signupRoute:
        return getPageRouteBuilder(
          routeName: signupRoute,
          child: const SignupPage(),
        );

      case homePageRoute:
        return getPageRouteBuilder(
          routeName: homePageRoute,
          child: const HomePage(),
        );

      case verifyPageRoute:
        return getPageRouteBuilder(
          routeName: verifyPageRoute,
          child: const VerifyPage(),
        );

      case addTransactionRoute:
        return getPageRouteBuilder(
          routeName: addTransactionRoute,
          child: const AddTransaction(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }

  PageRoute getPageRouteBuilder({
    required String routeName,
    // required BuildContext context,
    // required Animation<double> animation,
    // required Animation<double> secondaryAnimation,
    required Widget child,
  }) {
    return PageRouteBuilder(
      settings: RouteSettings(
        name: routeName,
      ),
      pageBuilder: (context, animation, secondaryAnimation) {
        return child;
      },
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          SlideTransition(
        position: animation.drive(tween),
        child: child,
      ),
    );
  }
}
