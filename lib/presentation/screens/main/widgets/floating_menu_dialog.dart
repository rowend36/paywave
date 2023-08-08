import 'package:ficonsax/ficonsax.dart';
import 'package:flutter/material.dart';
import 'package:paywave/presentation/screens/main/main_styles.dart';
import 'package:paywave/presentation/theme/app_colors.dart';

enum DialogResult {
  paymentLimit,
  oneTimePayment,
  numberOfTransactions,
  time,
  amount,
  done
}

void finishWithResult(BuildContext context, DialogResult? result) {
  Navigator.of(context, rootNavigator: true).pop(result);
}

class FloatingMenuDialog extends StatelessWidget {
  const FloatingMenuDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      alignment: Alignment.bottomCenter,
      backgroundColor: const Color(0x00FFFFFF),
      shadowColor: const Color(0x00FFFFFF),
      insetPadding: const EdgeInsets.only(bottom: 52),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          ElevatedButton(
              onPressed: () {
                finishWithResult(context, DialogResult.paymentLimit);
              },
              style: MainStyles.dialogButton(context, top: true),
              child: Text("Set Payment Limit",
                  style: MainStyles.titleMedium(context,
                      color: AppColors.lightOnPrimary))),
          const SizedBox(height: 4),
          ElevatedButton(
              onPressed: () {
                finishWithResult(context, DialogResult.oneTimePayment);
              },
              style: MainStyles.dialogButton(context, bottom: true),
              child: Text("One time payment",
                  style: MainStyles.titleMedium(context,
                      color: AppColors.lightOnPrimary))),
          const SizedBox(height: 4),
          GestureDetector(
              onTapDown: (_) {
                finishWithResult(context, null);
              },
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(
                  height: 56,
                  width: 56,
                  decoration: const BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(28)),
                    color: AppColors.primary,
                  ),
                  child: const AnimatedRotation(
                      duration: Duration(milliseconds: 300),
                      turns: 0.125,
                      child: Icon(
                          color: AppColors.lightOnPrimary,
                          IconsaxOutline.add,
                          size: 36)),
                )
              ]))
        ],
      ),
    );
  }
}
