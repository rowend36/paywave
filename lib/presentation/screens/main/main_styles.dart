import 'package:flutter/material.dart';
import 'package:paywave/presentation/theme/app_colors.dart';

class MainStyles {
  static ButtonStyle? outlinedButton1(BuildContext context) =>
      OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              foregroundColor: AppColors.primary,
              fixedSize: const Size(144, 48),
              side: const BorderSide(color: AppColors.primary))
          .merge(Theme.of(context).outlinedButtonTheme.style);

  static TextStyle? labelLarge(BuildContext context,
          {Color color = AppColors.primary}) =>
      Theme.of(context).textTheme.labelLarge?.copyWith(
          color: color,
          fontSize: 14,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w500,
          height: 1.42857,
          letterSpacing: 0.1);

  static TextStyle? labelMedium(BuildContext context,
          {Color color = AppColors.primary}) =>
      Theme.of(context).textTheme.labelMedium?.copyWith(
          color: color,
          fontSize: 12,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w500,
          height: 1.3333,
          letterSpacing: 0.5);

  static ButtonStyle? listButton(BuildContext context) =>
      ElevatedButton.styleFrom(
              backgroundColor: AppColors.white,
              elevation: 0,
              padding: const EdgeInsets.only(left: 8, right: 18),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)))
          .merge(Theme.of(context).elevatedButtonTheme.style);

  static TextStyle? titleLarge(BuildContext context,
          {Color color = AppColors.lightOnPrimaryContainer}) =>
      Theme.of(context).textTheme.titleLarge?.copyWith(
          color: color,
          fontSize: 22,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w500,
          height: 1.2);

  static TextStyle? titleMedium(BuildContext context,
          {Color color = AppColors.lightOnPrimaryContainer}) =>
      Theme.of(context).textTheme.titleMedium?.copyWith(
          color: color,
          fontSize: 16,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w500,
          height: 1.5);

  static TextStyle? bodyMedium(BuildContext context,
          {Color color = AppColors.lightOnPrimaryContainer}) =>
      Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: color,
            fontSize: 14,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400,
            height: 1.42857,
          );

  static ButtonStyle? dialogButton(BuildContext context,
          {bool top = false, bool bottom = false}) =>
      ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.lightOnPrimary,
        elevation: 1,
        padding: const EdgeInsets.all(20),
        fixedSize: const Size.fromWidth(266),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
                top: top ? const Radius.circular(16) : Radius.zero,
                bottom: bottom ? const Radius.circular(16) : Radius.zero)),
      ).merge(Theme.of(context).elevatedButtonTheme.style);

  static TextStyle? headlineMedium(BuildContext context,
          {Color color = AppColors.lightOnPrimaryContainer}) =>
      Theme.of(context).textTheme.headlineMedium?.copyWith(
            color: color,
            fontSize: 28,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w600,
            height: 1.2857,
          );

  static TextStyle? headlineSmall(BuildContext context,
          {Color color = AppColors.lightOnPrimaryContainer}) =>
      Theme.of(context).textTheme.headlineSmall?.copyWith(
            color: color,
            fontSize: 24,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w700,
            height: 1.33333,
          );
  static TextStyle? timePickerText(BuildContext context,
          {Color color = AppColors.lightOnPrimaryContainer}) =>
      Theme.of(context).textTheme.headlineSmall?.copyWith(
            color: color,
            fontSize: 32,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400,
            height: 1.1555,
          );

  static ButtonStyle? paymentLimitButton(BuildContext context) =>
      OutlinedButton.styleFrom(
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.lightOnPrimaryContainer,
        padding: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ).merge(Theme.of(context).elevatedButtonTheme.style);

  static ButtonStyle? textButton(BuildContext context) => TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        foregroundColor: AppColors.primary,
      ).merge(Theme.of(context).textButtonTheme.style);
}
