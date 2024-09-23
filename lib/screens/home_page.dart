import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:transaction_app/models/transaction_model.dart';
import 'package:transaction_app/screens/add_transaction.dart';
import 'package:transaction_app/services/api.dart';
import 'package:transaction_app/services/auth_services.dart';
import 'package:transaction_app/utils/colors.dart';
import 'package:transaction_app/utils/constants.dart';
import 'package:transaction_app/utils/routes.dart';
import 'package:transaction_app/utils/size_calculator.dart';
import 'package:transaction_app/widgets/background_layout.dart';
import 'package:transaction_app/widgets/buttons.dart';
import 'package:transaction_app/widgets/card_tile.dart';
import 'package:transaction_app/widgets/transaction_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late User? user;
  late final String userId;
  late Future<List<Transactions>> futureTransactions;
  final apiService = ApiService.instance;

  @override
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.currentUser;
    userId = user!.uid;
    log("*** home page => $user **");
    getAllTransactions();
  }

  Future<void> getAllTransactions() async {
    log("*** homepage userID => $userId **");
    // final transactions = await apiService.getTransactions(userId, context);
    log("*** homepage read => ${readTransaction()} **");

    futureTransactions = readTransaction();
    setState(() {});

    log("*** homepage transact => $futureTransactions **");
  }

  Future<List<Transactions>> readTransaction() async {
    final transactions = await apiService.getTransactions(userId, context);

    return transactions.toList();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtils.init(context);
    return BackgroundLayout(
      containerChild: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 4,
            child: Column(
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
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    user!.displayName!,
                    style: TextStyle(
                      fontSize: sizer(true, 32, context),
                      fontWeight: FontWeight.w600,
                      color: AppColors.textWhite,
                    ),
                    softWrap: true,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                ),
                // const SizedBox(
                //   height: 40,
                // ),
              ],
            ),
          ),
          SizedBox(
            width: sizer(true, 30, context),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  AuthService.instance.signout();
                  Navigator.pushReplacementNamed(
                    context,
                    RouteHelper.loginRoute,
                  );
                },
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
              child: FutureBuilder<List<Transactions>>(
                  future: futureTransactions,
                  builder: (context, snapShot) {
                    if (snapShot.hasData) {
                      final transactions = snapShot.data!;
                      //
                      return ListView.builder(
                          itemCount: transactions.length,
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            final transacts = transactions[index];
                            return TransactionCard(
                              child: CardTile(
                                name: transacts.name,
                                type: transacts.type,
                                amount: transacts.amount,
                                dateTime: apiService
                                    .formatedDateTime(transacts.createdAt),
                              ),
                            );
                          });
                    } else {
                      return const Center(
                        child: SizedBox(
                          height: 200,
                          child: Text(
                            'No transactions yet!!! 🙇🏽‍♂️🙇🏽‍♀️',
                            style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.w600,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                      );
                    }
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
                Navigator.pushNamed(
                  context,
                  RouteHelper.addTransactionRoute,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
