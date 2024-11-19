import 'dart:async';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:transaction_app/data/services/auth_services.dart';
import 'package:transaction_app/utils/colors.dart';
import 'package:transaction_app/utils/constants.dart';
import 'package:transaction_app/utils/routes.dart';
import 'package:transaction_app/utils/size_calculator.dart';
import 'package:transaction_app/widgets/background_layout.dart';
import 'package:transaction_app/widgets/box_container.dart';
import 'package:transaction_app/widgets/buttons.dart';

class VerifyPage extends StatefulWidget {
  const VerifyPage({super.key});

  @override
  State<VerifyPage> createState() => _VerifyPageState();
}

class _VerifyPageState extends State<VerifyPage> {
  late Timer timer;

  @override
  void initState() {
    super.initState();
    log("****** init state**** called!!!");
    AuthService.instance.sendVerifyEmailLink();

    timer = Timer.periodic(
      const Duration(seconds: 5),
      (timer) {
        User? user = FirebaseAuth.instance.currentUser;
        log("****** inside timer");
        user?.reload();
        log("**# user reloaded ===>");
        if (user?.emailVerified == true) {
          log("navigating to home page******");
          Navigator.pushReplacementNamed(
            context,
            RouteHelper.homePageRoute,
          );
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtils.init(context);
    return BackgroundLayout(
      right: ScreenUtils.positionRight,
      top: ScreenUtils.positionTop,
      containerChild: Container(
        margin: EdgeInsets.only(bottom: 80, left: ScreenUtils.positionRight),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Good afternoon',
                  style: TextStyle(
                    fontSize: sizer(true, 14, context),
                    fontWeight: FontWeight.w500,
                    color: AppColors.textWhite,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Very Email',
                  style: TextStyle(
                    fontSize: sizer(true, 20, context),
                    fontWeight: FontWeight.w600,
                    color: AppColors.textWhite,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      positionedChild: BoxContainer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'A verification email has been sent to your email.',
              style: TextStyle(
                fontSize: sizer(true, 18, context),
                fontWeight: FontWeight.w600,
                color: AppColors.textDark,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            Buttons(
              width: sizer(true, 317, context),
              color: AppColors.lightGreenColor,
              buttonText: 'Resend Email',
              buttonTextColor: AppColors.textWhite,
              buttonClick: () {
                AuthService.instance.sendVerifyEmailLink();
              },
            ),
            const SizedBox(
              height: 30,
            ),
            Buttons(
              width: sizer(true, 317, context),
              color: AppColors.primaryWhite,
              hasButtonBorder: true,
              buttonText: 'Cancel',
              buttonTextColor: AppColors.buttonGreenColor,
            ),
          ],
        ),
      ),
    );
  }
}
