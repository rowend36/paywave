import 'package:ficonsax/ficonsax.dart';
import 'package:flutter/material.dart';
import 'package:paywave/presentation/screens/main/main_styles.dart';
import 'package:paywave/presentation/screens/main/widgets/floating_menu_dialog.dart';
import 'package:paywave/presentation/theme/app_colors.dart';

class ChooseLimitDialog extends StatelessWidget {
  const ChooseLimitDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      alignment: Alignment.bottomCenter,
      insetPadding: EdgeInsets.zero,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 22, right: 22, bottom: 56, top: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
                alignment: Alignment.topRight,
                child: IconButton(
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true).pop();
                    },
                    icon: const Icon(IconsaxOutline.close_square))),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 48),
              child: Text("Set Payment Limit by",
                  style: MainStyles.headlineMedium(context)),
            ),
            Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: OutlinedButton(
                    onPressed: () {
                      finishWithResult(
                          context, DialogResult.numberOfTransactions);
                    },
                    style: MainStyles.paymentLimitButton(context),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Number of transactions",
                            style: MainStyles.titleMedium(context)),
                        const Icon(
                          IconsaxOutline.arrow_right_3,
                          color: AppColors.lightOnPrimaryContainer,
                        )
                      ],
                    ))),
            Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: OutlinedButton(
                    onPressed: () {
                      finishWithResult(context, DialogResult.time);
                    },
                    style: MainStyles.paymentLimitButton(context),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Time", style: MainStyles.titleMedium(context)),
                        const Icon(
                          IconsaxOutline.arrow_right_3,
                          color: AppColors.lightOnPrimaryContainer,
                        )
                      ],
                    ))),
            Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: OutlinedButton(
                    onPressed: () {
                      finishWithResult(context, DialogResult.amount);
                    },
                    style: MainStyles.paymentLimitButton(context),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Amount", style: MainStyles.titleMedium(context)),
                        const Icon(
                          IconsaxOutline.arrow_right_3,
                          color: AppColors.lightOnPrimaryContainer,
                        )
                      ],
                    ))),
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: OutlinedButton(
                onPressed: () {
                  finishWithResult(context, DialogResult.oneTimePayment);
                },
                style: MainStyles.paymentLimitButton(context),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("One time payment",
                        style: MainStyles.titleMedium(context)),
                    const Icon(
                      IconsaxOutline.arrow_right_3,
                      color: AppColors.lightOnPrimaryContainer,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
