import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:transaction_app/data/services/api.dart';
import 'package:transaction_app/data/services/api_exception.dart';
import 'package:transaction_app/data/repositories/transaction_repository.dart';
import 'package:transaction_app/models/transaction_model.dart';
import 'package:transaction_app/models/types.dart';
import 'package:transaction_app/utils/colors.dart';
import 'package:transaction_app/utils/constants.dart';
import 'package:transaction_app/utils/size_calculator.dart';
import 'package:transaction_app/widgets/background_layout.dart';
import 'package:transaction_app/widgets/box_container.dart';
import 'package:transaction_app/widgets/buttons.dart';
import 'package:transaction_app/widgets/general_textfield.dart';
import 'package:transaction_app/widgets/type_dropdown.dart';

class AddTransaction extends StatefulWidget {
  final Transactions? transaction;
  final bool? isEditMode;
  const AddTransaction({
    super.key,
    this.transaction,
    this.isEditMode = false,
  });

  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  final typeTextEditingController = TextEditingController();
  final amountTextEditingController = TextEditingController();
  final nameTextEditingController = TextEditingController();
  final focusNode = FocusNode();
  final transactionRepository =
      TransactionRepository(apiService: ApiService.instance);
  final firebaseAuth = FirebaseAuth.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.isEditMode!) {
      setState(() {
        nameTextEditingController.text = widget.transaction!.name;
        typeTextEditingController.text = widget.transaction!.type.toName;
        amountTextEditingController.text =
            widget.transaction!.amount.toString();
      });
    }
  }

  // Future addTransaction() async {
  //   final name = nameTextEditingController.text;
  //   final type = typeTextEditingController.text;
  //   final amount = double.tryParse(amountTextEditingController.text);
  //   final userId = firebaseAuth.currentUser?.uid;

  //   apiService.createTransaction(name, type, amount!, userId!, context);
  // }

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
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: BackgroundLayout(
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
                // focusNode: focusNode,
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

              TypeDropdown(
                textController: typeTextEditingController,
              ),

              // GeneralTextField(
              //   textController: typeTextEditingController,
              //   hintText: 'Income/Expense',
              //   // focusNode: focusNode,
              // ),
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
                // focusNode: focusNode,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 30,
              ),
              Buttons(
                width: sizer(true, 317, context),
                color: AppColors.lightGreenColor,
                buttonText: 'Add Transaction',
                buttonTextColor: AppColors.textWhite,
                buttonClick: () {
                  final name = nameTextEditingController.text;
                  final type = Types.fromJson(typeTextEditingController.text);
                  final amount =
                      double.tryParse(amountTextEditingController.text);
                  final userId = firebaseAuth.currentUser?.uid;
                  try {
                    if (widget.isEditMode!) {
                      transactionRepository.updateTransaction(name, amount!,
                          type, userId!, widget.transaction!.id, context);
                    } else {
                      transactionRepository.addTransaction(
                          name, amount!, type, userId!, context);
                    }
                  } on ApiException catch (e) {
                    // Show the error dialog in the UI layer
                    ApiException.show(context, e.code ?? "unknown-error",
                        message: e.message);
                  } catch (e) {
                    // Handle unexpected errors gracefully
                    ApiException.show(context, "An unexpected error occurred");
                  }

                  Navigator.pop(context);
                },
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
