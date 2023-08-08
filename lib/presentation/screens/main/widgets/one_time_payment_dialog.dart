import 'package:flutter/material.dart';
import 'package:paywave/presentation/screens/main/main_styles.dart';
import 'package:paywave/presentation/screens/main/widgets/floating_menu_dialog.dart';
import 'package:paywave/presentation/theme/app_colors.dart';
import 'package:paywave/presentation/widget/gradient_button.dart';

class OneTimePaymentDialog extends StatelessWidget {
  const OneTimePaymentDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(24))),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 24),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                  alignment: Alignment.topLeft,
                  child: Image.asset("public/images/main_clock.png",
                      width: 100, height: 100)),
              Padding(
                  padding: const EdgeInsets.only(top: 32, bottom: 16),
                  child: Text("One Time Payment",
                      style: MainStyles.headlineMedium(context,
                          color: AppColors.lightOnSurface))),
              Text(
                  "Your card would be disabled immediately after the first transaction",
                  style: MainStyles.titleMedium(context,
                      color: AppColors.neutral50)),
              Padding(
                padding: const EdgeInsets.only(top: 32),
                child: GradientButton(
                  text: "OK",
                  borderRadius: BorderRadius.circular(8),
                  onPressed: () {
                    finishWithResult(context, null);
                  },
                ),
              )
            ]),
      ),
    );
  }
}
