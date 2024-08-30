// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:transaction_app/utils/colors.dart';
import 'package:transaction_app/utils/constants.dart';

class BoxContainer extends StatelessWidget {
  final Widget? child;
  const BoxContainer({
    super.key,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    ScreenUtils.init(context);
    return Container(
      width: ScreenUtils.screenWidth * 0.87,
      // height: 637,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30,),
      decoration: const BoxDecoration(
        color: AppColors.primaryWhite,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20)
        ),
      ),
      child: child,
    );
  }
}
