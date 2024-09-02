import 'package:flutter/material.dart';
import 'package:transaction_app/utils/colors.dart';
import 'package:transaction_app/utils/constants.dart';

class BackgroundLayout extends StatelessWidget {
  final Widget? containerChild;
  final Widget? positionedChild;
  final double? left;
  final double? right;
  final double? top;
  final double? bottom;
  final double height;
  const BackgroundLayout({
    super.key,
    this.containerChild,
    this.positionedChild,
    this.left,
    this.right,
    this.top,
    this.bottom,
    this.height = 0.80,
  });

  @override
  Widget build(BuildContext context) {
    ScreenUtils.init(context);
    return Scaffold(
      backgroundColor: AppColors.primaryWhite,
      body: SizedBox(
        width: ScreenUtils.screenWidth,
        height: ScreenUtils.screenHeight,
        child: Stack(
          children: [
            Container(
              height: ScreenUtils.screenHeight * 0.327,
              decoration: const BoxDecoration(
                color: AppColors.deepGreenColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.elliptical(200, 30),
                  bottomRight: Radius.elliptical(200, 30),
                ),
              ),
              child: containerChild,
            ),
            Positioned(
              left: left,
              right: right,
              top: top,
              bottom: bottom,
              height: ScreenUtils.screenHeight * height,
              child: positionedChild ?? const SizedBox(),
            ),
            // Align(
            //   alignment: AlignmentDirectional(0, -0.9),
            //   child: positionedChild ?? const SizedBox(),
            // ),
          ],
        ),
      ),
    );
  }
}


// {Widget? containerChild, Widget? positionedChild, double? left, double? right, double? top, double? bottom}) {
//   ScreenUtils.init(context);
