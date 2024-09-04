import 'package:flutter/material.dart';
import 'package:transaction_app/utils/colors.dart';
import 'package:transaction_app/utils/constants.dart';
import 'package:transaction_app/utils/size_calculator.dart';
import 'package:transaction_app/widgets/background_layout.dart';
import 'package:transaction_app/widgets/box_container.dart';
import 'package:transaction_app/widgets/buttons.dart';

class VerifyPage extends StatelessWidget {
  const VerifyPage({super.key});

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
