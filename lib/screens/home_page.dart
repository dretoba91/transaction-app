import 'package:flutter/material.dart';
import 'package:transaction_app/screens/add_transaction.dart';
import 'package:transaction_app/utils/colors.dart';
import 'package:transaction_app/utils/constants.dart';
import 'package:transaction_app/utils/size_calculator.dart';
import 'package:transaction_app/widgets/background_layout.dart';
import 'package:transaction_app/widgets/buttons.dart';
import 'package:transaction_app/widgets/card_tile.dart';
import 'package:transaction_app/widgets/transaction_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtils.init(context);
    return BackgroundLayout(
      containerChild: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: sizer(false, 70, context),
              ),
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
              // const SizedBox(
              //   height: 40,
              // ),
            ],
          ),
          SizedBox(
            width: sizer(true, 30, context),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Icon(
                    Icons.logout_outlined,
                    color: AppColors.primaryWhite,
                    size: sizer(true, 28, context),
                  ),
                ),
              ),
              SizedBox(
                height: sizer(false, 50, context),
              ),
            ],
          ),
        ],
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
                    return const TransactionCard(
                      child: CardTile(
                        name: 'Netflix',
                        type:
                            'This is just a testing progress for the list view builder inside a column in a positioned widget in a stack',
                        amount: '\$20,000',
                      ),
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
              buttonClick: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddTransaction(),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
