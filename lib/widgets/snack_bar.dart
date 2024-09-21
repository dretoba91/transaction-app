import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:transaction_app/utils/colors.dart';
import 'package:transaction_app/utils/size_calculator.dart';

class SnackBarHandler extends StatelessWidget {
  final String message;
  final Color backgroundColor;

  const SnackBarHandler({
    required this.message,
    this.backgroundColor = AppColors.lightGreenColor,
    super.key,
  });

  void show(BuildContext context) {
    log("snack bar message => $message");
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(
            fontSize: sizer(true, 14, context),
            fontWeight: FontWeight.w600,
            color: AppColors.textDark,
          ),
        ),
        backgroundColor: backgroundColor,
        duration: const Duration(
          seconds: 10,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
