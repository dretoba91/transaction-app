import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:transaction_app/screens/authentication/verify_page.dart';
import 'package:transaction_app/screens/home_page.dart';
import 'package:transaction_app/data/services/auth_services.dart';
import 'package:transaction_app/utils/colors.dart';
import 'package:transaction_app/utils/constants.dart';
import 'package:transaction_app/utils/size_calculator.dart';
import 'package:transaction_app/utils/validation.dart';
import 'package:transaction_app/widgets/background_layout.dart';
import 'package:transaction_app/widgets/box_container.dart';
import 'package:transaction_app/widgets/buttons.dart';
import 'package:transaction_app/widgets/general_textfield.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final emailTextEditingController = TextEditingController();
  final passwordTextEditingController = TextEditingController();
  final nameTextEditingController = TextEditingController();
  final focusNode = FocusNode();

  @override
  void dispose() {
    emailTextEditingController.dispose();
    passwordTextEditingController.dispose();
    nameTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtils.init(context);
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: BackgroundLayout(
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
                    'Register Here!',
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
                'NAME',
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
                textController: nameTextEditingController,
                hintText: 'Enter your name',
                keyboardType: TextInputType.name,
                autoValidateMode: AutovalidateMode.onUserInteraction,
                // focusNode: focusNode,
              ),
              const SizedBox(
                height: 30,
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
                keyboardType: TextInputType.emailAddress,
                autoValidateMode: AutovalidateMode.onUserInteraction,
                validator: emailVal,
                // focusNode: focusNode,
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
                autoValidateMode: AutovalidateMode.onUserInteraction,
                validator: passwordVal,
                // focusNode: focusNode,
              ),
              const SizedBox(
                height: 30,
              ),
              Buttons(
                width: sizer(true, 317, context),
                color: AppColors.lightGreenColor,
                buttonText: 'Sign Up',
                buttonTextColor: AppColors.textWhite,
                buttonClick: () {
                  // signUpUser();
                  final email = emailTextEditingController.text;
                  final password = passwordTextEditingController.text;
                  final name = nameTextEditingController.text;
                  AuthService.instance.signUpUser(
                    email: email,
                    password: password,
                    name: name,
                  );
                  // auto routing to the homepage
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const VerifyPage(),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 30,
              ),
              Buttons(
                width: sizer(true, 317, context),
                color: AppColors.primaryWhite,
                hasButtonBorder: true,
                buttonText: 'Sign Up With Google',
                buttonTextColor: AppColors.buttonGreenColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
