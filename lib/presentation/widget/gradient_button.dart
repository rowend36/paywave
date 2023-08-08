import 'package:flutter/material.dart';
import 'package:paywave/presentation/theme/app_colors.dart';

class GradientButton extends StatelessWidget {
  final String text;
  final Function? onPressed;
  final EdgeInsets padding;
  final BorderRadius borderRadius;
  const GradientButton(
      {super.key,
      required this.onPressed,
      required this.text,
      this.padding = const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      this.borderRadius = const BorderRadius.all(Radius.circular(24))});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            gradient: const LinearGradient(colors: AppColors.gradient1),
            borderRadius: borderRadius),
        child: ElevatedButton(
          onPressed: onPressed != null
              ? () {
                  onPressed!();
                }
              : null,
          style: ElevatedButton.styleFrom(
              padding: padding,
              shape: RoundedRectangleBorder(borderRadius: borderRadius),
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              foregroundColor: AppColors.lightOnPrimary),
          child: Text(text),
        ));
  }
}
