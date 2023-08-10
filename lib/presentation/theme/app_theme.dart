import 'package:flutter/material.dart';
import 'package:paywave/presentation/theme/app_colors.dart';
import 'package:paywave/utils/create_material_color.dart';

MaterialColor bodyColor = const MaterialColor(
  0xFFF3F3F3,
  <int, Color>{
    50: Color(0xFFFAFAFA),
    100: Color(0xFFF6F6F6),
    200: Color(0xFFF3F3F3),
    300: Color(0xFFEFEFEF),
    400: Color(0xFFEAEAEA),
    500: Color(0xFFF3F3F3),
    600: Color(0xFFD6D6D6),
    700: Color(0xFFC9C9C9),
    800: Color(0xFFBCBCBC),
    900: Color(0xFFAFAFAF),
  },
);

final ThemeData appTheme = ThemeData(
  primarySwatch: bodyColor,
  // Add more theme configurations as needed
);

final ThemeData appTheme2 = ThemeData(
  primarySwatch: createMaterialColor(AppColors.primary),
  inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)))),
  // Add more theme configurations as needed
);
