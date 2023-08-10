import 'package:flutter/material.dart';
import 'package:ficonsax/ficonsax.dart';
import 'package:paywave/data/models/transactions.dart';
import 'package:paywave/utils/format_date.dart';
import 'package:paywave/presentation/theme/app_colors.dart';
import 'package:paywave/presentation/screens/main/main_styles.dart';

class TransactionItemWidget extends StatelessWidget {
  final TransactionItem transaction;
  const TransactionItemWidget({required this.transaction, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(left: 16, right: 24, top: 8, bottom: 8),
        color: AppColors.transactionBackgrounds[transaction.isDebit ? 1 : 0],
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Padding(
            padding: const EdgeInsets.only(right: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  formatDate(transaction.timestamp),
                  style: MainStyles.labelMedium(context,
                      color: AppColors.lightOnSurfaceVariant),
                ),
                Text(
                  transaction.title,
                  style:
                      MainStyles.titleMedium(context, color: AppColors.primary),
                ),
                Text(transaction.description,
                    style: MainStyles.bodyMedium(context,
                        color: AppColors.lightOnSurfaceVariant))
              ],
            ),
          ),
          Icon(transaction.isDebit
              ? IconsaxOutline.money_send
              : IconsaxOutline.money_recive)
        ]));
  }
}
