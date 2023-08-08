import 'package:flutter/material.dart';

class AppColors {
  static const Color neutral60 = Color(0xFF948F94);
  static const Color neutral50 = Color(0xFF7A767A);
  static const Color error = Color(0xFFBA1A1A);
  static const Color primary = Color(0xFF8A00E8);
  static const Color darkPrimaryFixedDim = Color(0xFFDEB7FF);
  static const Color lightPrimaryContainer = Color(0xFFF0DBFF);
  static const Color lightOnPrimary = Color(0xFFFFFFFF);
  static const Color darkOnPrimary = Color(0xFF4A007F);
  static const Color lightOnPrimaryContainer = Color(0xFF2C0050);
  static const Color primary10 = Color(0xFF2C0050);
  static const Color refError90 = Color(0xFFFFDAD6);
  static const Color lightSurfaceVariant = Color(0xFFE9DFEB);
  static const Color lightOnSurfaceVariant = Color(0xFF4A454E);
  static const Color lightOnSurface = Color(0xFF1D1B1E);
  static const Color lightSurfaceContainerHigh = Color(0xFFEDE6EB);
  static const Color white = Color(0xFFFFFFFF);

  static const List<Color> gradient1 = [Color(0xFF9A11FF), Color(0xFF01C8FF)];
  static const List<Color> transactionBackgrounds = [
    AppColors.refError90,
    AppColors.lightSurfaceVariant
  ];
  static MaterialStateProperty<T> toMaterialState<T>(T value) {
    return MaterialStateProperty.resolveWith((states) {
      return value;
    });
  }

  static final primaryMaterialState =
      AppColors.toMaterialState(AppColors.primary);
}
