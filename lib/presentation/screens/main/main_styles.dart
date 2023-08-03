import 'package:flutter/material.dart';
import 'package:paywave/presentation/theme/app_colors.dart';

class MainStyles {
  static outlinedButton1(context) => OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          foregroundColor: AppColors.primary,
          fixedSize: const Size(144, 48),
          side: const BorderSide(color: AppColors.primary))
      .merge(Theme.of(context).outlinedButtonTheme.style);

  static labelLarge(context, {color = AppColors.primary}) =>
      Theme.of(context).textTheme.labelLarge?.copyWith(
          color: color,
          fontSize: 14,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w500,
          height: 1.42857,
          letterSpacing: 0.1);
}
