// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:transaction_app/utils/colors.dart';
import 'package:transaction_app/utils/constants.dart';

class TransactionCard extends StatelessWidget {
  final Widget child;
  const TransactionCard({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    ScreenUtils.init(context);
    return Container(
      height: 100,
      // width: ScreenUtils.screenWidth * 0.50,
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 2),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
        border: Border.all(
          color: const Color.fromRGBO(255, 255, 255, 0.2),
        ),
        color: AppColors.primaryWhite,
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: AppColors.lightGrey,
            offset: Offset(6, 6),
            blurRadius: 16,
          ),
          BoxShadow(
            color: AppColors.primaryWhite,
            offset: Offset(-6, -6),
            blurRadius: 16,
          ),
        ],
      ),
      child: child,
    );
  }
}
