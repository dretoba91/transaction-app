import 'package:flutter/material.dart';
import 'package:transaction_app/utils/colors.dart';
import 'package:transaction_app/utils/constants.dart';
import 'package:transaction_app/utils/size_calculator.dart';
import 'package:transaction_app/widgets/background_layout.dart';
import 'package:transaction_app/widgets/box_container.dart';
import 'package:transaction_app/widgets/buttons.dart';
import 'package:transaction_app/widgets/general_textfield.dart';

class AddTransaction extends StatefulWidget {
  const AddTransaction({super.key});

  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  final typeTextEditingController = TextEditingController();
  final amountTextEditingController = TextEditingController();
  final nameTextEditingController = TextEditingController();
  final focusNode = FocusNode();

  @override
  void dispose() {
    typeTextEditingController.dispose();
    amountTextEditingController.dispose();
    nameTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtils.init(context);
    return BackgroundLayout(
      right: ScreenUtils.positionRight,
      top: ScreenUtils.positionTop,
      containerChild: Container(
        margin: EdgeInsets.only(
          bottom: 80,
          left: ScreenUtils.positionRight,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_ios_new_outlined,
                size: sizer(true, 20, context),
                color: AppColors.primaryWhite,
              ),
            ),
            const SizedBox(
              width: 80,
            ),
            Text(
              'Add Transaction',
              style: TextStyle(
                fontSize: sizer(true, 18, context),
                fontWeight: FontWeight.w600,
                color: AppColors.textWhite,
              ),
            ),
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
              hintText: 'Name of Income/Expense',
              focusNode: focusNode,
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              'TYPE',
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
              textController: typeTextEditingController,
              hintText: 'Income/Expense',
              focusNode: focusNode,
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              'AMOUNT',
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
              textController: amountTextEditingController,
              hintText: 'Amount',
              focusNode: focusNode,
            ),
            const SizedBox(
              height: 30,
            ),
            Buttons(
              width: sizer(true, 317, context),
              color: AppColors.lightGreenColor,
              buttonText: 'Add Transaction',
              buttonTextColor: AppColors.textWhite,
              buttonClick: () {},
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
