import 'package:flutter/material.dart';
import 'package:transaction_app/utils/colors.dart';
import 'package:transaction_app/utils/size_calculator.dart';

class Buttons extends StatelessWidget {
  final double? width;
  final Color? color;
  final bool hasButtonBorder;
  final String? buttonText;
  final Color? buttonTextColor;
  final double borderRadius;
  final double height;
  const Buttons({
    super.key,
    this.width,
    this.color,
    this.hasButtonBorder = false,
    this.buttonText,
    this.buttonTextColor,
    this.borderRadius = 8,
    this.height = 41,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: GestureDetector(
        onTap: () {},
        child: Container(
          height: sizer(false, height, context),
          width: width,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(borderRadius),
            border: hasButtonBorder
                ? Border.all(
                    color: AppColors.buttonRadiusGreenColor,
                  )
                : Border.all(style: BorderStyle.none),
          ),
          child: Center(
            child: Text(
              buttonText ?? '',
              style: TextStyle(
                fontSize: sizer(true, 18, context),
                fontWeight: FontWeight.w600,
                color: buttonTextColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
