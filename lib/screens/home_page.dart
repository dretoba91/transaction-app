import 'package:flutter/material.dart';
import 'package:transaction_app/utils/colors.dart';
import 'package:transaction_app/utils/constants.dart';
import 'package:transaction_app/utils/size_calculator.dart';
import 'package:transaction_app/widgets/background_layout.dart';
import 'package:transaction_app/widgets/buttons.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundLayout(
      containerChild: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Good afternoon,',
              style: TextStyle(
                fontSize: sizer(true, 24, context),
                fontWeight: FontWeight.w500,
                color: AppColors.textWhite,
              ),
            ),
            Text(
              'Enjelin Morgeana',
              style: TextStyle(
                fontSize: sizer(true, 32, context),
                fontWeight: FontWeight.w600,
                color: AppColors.textWhite,
              ),
            ),
          ],
        ),
      ),
      height: 0.67,
      top: ScreenUtils.screenHeight * 0.33,
      positionedChild: Container(
        width: ScreenUtils.screenWidth,
        padding:
            const EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 8,
              child: ListView.builder(
                  itemCount: 20,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return const ListTile(
                      title: Text('Testing transactions'),
                      subtitle: Text(
                          'This is just a testing progress for the list view builder inside a column in a positioned widget in a stack'),
                    );
                  }),
            ),

            const SizedBox(
              height: 20,
            ),
        
            Buttons(
              width: sizer(true, 177, context),
              borderRadius: 40,
              height: 54,
              buttonText: 'Add Transaction',
              buttonTextColor: AppColors.textWhite,
              color: AppColors.lightGreenColor,
            )
          ],
        ),
      ),
    );
  }
}
