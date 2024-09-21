import 'package:flutter/material.dart';
import 'package:transaction_app/utils/colors.dart';
import 'package:transaction_app/utils/size_calculator.dart';

class CardTile extends StatelessWidget {
  final String name;
  final String type;
  final String amount;
  final String dateTime;
  const CardTile(
      {super.key,
      required this.name,
      required this.type,
      required this.amount,
      required this.dateTime});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 8,
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 6,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                          fontSize: sizer(true, 16, context),
                          fontWeight: FontWeight.w600,
                          color: AppColors.textDark2,
                        ),
                        softWrap: true,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        dateTime,
                        style: TextStyle(
                          fontSize: sizer(true, 13, context),
                          fontWeight: FontWeight.w500,
                          color: AppColors.lightGreenColor,
                        ),
                        softWrap: true,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                Text(
                  type,
                  style: TextStyle(
                    fontSize: sizer(true, 13, context),
                    fontWeight: FontWeight.w500,
                    color: AppColors.textDark2,
                  ),
                  softWrap: true,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: const Icon(
                    Icons.more_horiz,
                    color: AppColors.deepGreenColor,
                  ),
                ),
                Text(
                  amount,
                  style: TextStyle(
                    fontSize: sizer(true, 14, context),
                    fontWeight: FontWeight.w600,
                    color: AppColors.deepGreenColor,
                  ),
                  softWrap: true,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
