import 'package:ficonsax/ficonsax.dart';
import 'package:flutter/material.dart';
import 'package:paywave/presentation/screens/main/main_styles.dart';
import 'package:paywave/presentation/screens/main/widgets/floating_menu_dialog.dart';
import 'package:paywave/presentation/theme/app_colors.dart';
import 'package:paywave/presentation/widget/gradient_button.dart';

class NumberOfPaymentsDialog extends StatefulWidget {
  const NumberOfPaymentsDialog({super.key});

  @override
  State<NumberOfPaymentsDialog> createState() => _NumberOfPaymentsDialogState();
}

class _NumberOfPaymentsDialogState extends State<NumberOfPaymentsDialog> {
  final _formKey = GlobalKey<FormState>();
  String value = "0";

  _setNumberOfPayments() {
    /* TODO */
    finishWithResult(context, DialogResult.done);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.lightSurfaceContainerHigh,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Form(
        key: _formKey,
        child: Container(
          width: 328,
          padding: const EdgeInsets.all(24),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Deactivate card after",
                    style: MainStyles.headlineSmall(context,
                        color: AppColors.lightOnSurfaceVariant)),
                Padding(
                  padding: const EdgeInsets.only(top: 12, bottom: 24),
                  child: Row(
                    children: [
                      Expanded(
                          child: TextFormField(
                        keyboardType: TextInputType.number,
                        initialValue: value,
                        validator: (value) {
                          return value ?? int.tryParse(value!)?.toString();
                        },
                        onFieldSubmitted: (value) {
                          this.value = value;
                        },
                        textAlign: TextAlign.center,
                        style: MainStyles.timePickerText(context),
                        decoration: const InputDecoration(
                          // focusColor: AppColors.primary,
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.primary,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                          fillColor: AppColors.lightPrimaryContainer,
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColors.primary, width: 2),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                        ),
                      )),
                      Expanded(
                        child: Center(
                          child: Text(
                            "payment",
                            style: MainStyles.titleMedium(context,
                                color: AppColors.lightOnSurface),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Transform.translate(
                      offset: const Offset(-10, 0),
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {/* TODO */},
                        icon: const Icon(IconsaxOutline.clock, size: 24),
                      ),
                    ),
                    const Spacer(),
                    TextButton(
                        onPressed: () {
                          finishWithResult(context, DialogResult.paymentLimit);
                        },
                        style: MainStyles.textButton(context),
                        child: const Text("Cancel")),
                    GradientButton(onPressed: _setNumberOfPayments, text: "Ok")
                  ],
                )
              ]),
        ),
      ),
    );
  }
}
