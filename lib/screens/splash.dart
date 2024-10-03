import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:transaction_app/services/auth_services.dart';
import 'package:transaction_app/utils/colors.dart';
import 'package:transaction_app/utils/constants.dart';
import 'package:transaction_app/utils/routes.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();

    loadingChange();
  }

  loadingChange() async {
    final isLoggedIn = await AuthService.instance.checkUserAuthState();
    if (mounted) {
      if (isLoggedIn) {
        Navigator.pushReplacementNamed(
          context,
          RouteHelper.homePageRoute,
        );
      } else {
        Navigator.pushReplacementNamed(
          context,
          RouteHelper.loginRoute,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtils.init(context);
    return Scaffold(
      //app layer link
      body: SizedBox(
        height: ScreenUtils.screenHeight,
        width: ScreenUtils.screenWidth,
        child: const Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            Column(
              children: [],
            ),
          ],
        ),
      ),
    );
  }
}
