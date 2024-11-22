import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:transaction_app/data/services/api_exception.dart';
import 'package:transaction_app/screens/authentication/reset_password.dart';
import 'package:transaction_app/screens/authentication/signup_page.dart';
import 'package:transaction_app/screens/authentication/verify_page.dart';
import 'package:transaction_app/screens/home_page.dart';
import 'package:transaction_app/data/services/auth_services.dart';
import 'package:transaction_app/utils/colors.dart';
import 'package:transaction_app/utils/constants.dart';
import 'package:transaction_app/utils/routes.dart';
import 'package:transaction_app/utils/size_calculator.dart';
import 'package:transaction_app/widgets/background_layout.dart';
import 'package:transaction_app/widgets/box_container.dart';
import 'package:transaction_app/widgets/buttons.dart';
import 'package:transaction_app/widgets/general_textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailTextEditingController = TextEditingController();
  final passwordTextEditingController = TextEditingController();
  final focusNode = FocusNode();

  @override
  void dispose() {
    emailTextEditingController.dispose();
    passwordTextEditingController.dispose();
    super.dispose();
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
                  'Login Here!',
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
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              'EMAIL',
              style: TextStyle(
                fontSize: sizer(true, 12, context),
                fontWeight: FontWeight.w500,
                color: AppColors.textDark2,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GeneralTextField(
              textController: emailTextEditingController,
              hintText: 'Enter your email',
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              'PASSWORD',
              style: TextStyle(
                fontSize: sizer(true, 12, context),
                fontWeight: FontWeight.w500,
                color: AppColors.textDark2,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GeneralTextField(
              textController: passwordTextEditingController,
              hintText: 'Enter your password',
            ),
            const SizedBox(
              height: 30,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const VerifyPage()),
                  );
                },
                child: Text(
                  'Forgot Password',
                  style: TextStyle(
                    fontSize: sizer(true, 12, context),
                    fontWeight: FontWeight.w700,
                    color: AppColors.deepGreenColor,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Buttons(
              width: sizer(true, 317, context),
              color: AppColors.lightGreenColor,
              buttonText: 'Login',
              buttonTextColor: AppColors.textWhite,
              buttonClick: () {
                // login();
                final email = emailTextEditingController.text;
                final password = passwordTextEditingController.text;
                try {
                  AuthService.instance.login(
                    email,
                    password,
                  );
                  // Navigator.pushReplacementNamed(
                  //   context,
                  //   RouteHelper.homePageRoute,
                  // );
                } on ApiException catch (e) {
                  // Display error to the user
                  log("calling exception on login");
                  ApiException.show(context, e.code ?? "unknown",
                      message: e.message);
                }
              },
            ),
            const SizedBox(
              height: 30,
            ),
            Buttons(
              width: sizer(true, 317, context),
              color: AppColors.primaryWhite,
              hasButtonBorder: true,
              buttonText: 'Login With Google',
              buttonTextColor: AppColors.buttonGreenColor,
            ),
            const SizedBox(
              height: 100,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Not register? ',
                      style: TextStyle(
                        fontSize: sizer(true, 14, context),
                        fontWeight: FontWeight.w500,
                        color: AppColors.textDark2,
                      ),
                    ),
                    TextSpan(
                      text: 'Register',
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushNamed(
                            context,
                            RouteHelper.signupRoute,
                          );
                        },
                      style: TextStyle(
                        fontSize: sizer(true, 16, context),
                        fontWeight: FontWeight.w600,
                        color: AppColors.deepGreenColor,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
