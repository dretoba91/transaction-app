import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:transaction_app/utils/colors.dart';
import 'package:transaction_app/utils/size_calculator.dart';

snackBarHandler({
  required BuildContext context,
  String message = '',
}) {
  log("snack bar message => $message");
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: TextStyle(
          fontSize: sizer(true, 14, context),
          fontWeight: FontWeight.w600,
          color: AppColors.textDark,
        ),
      ),
      backgroundColor: AppColors.secondaryRedColor,
      duration: const Duration(
        seconds: 10,
      ),
    ),
  );
}
