import 'package:flutter/material.dart';

class AllTheme {
  final normalColor = Color(0xFF7A767A);

  final customColor = Color(0xFF9A11FF);

  final gradientTheme = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF9A11FF),
      Color(0xFF01C8FF),
    ],
    stops: [0.0, 1.0],
    transform:
        GradientRotation(135 * 3.14159 / 180), // Convert degrees to radians
  );

  final buttonInactiveColor = Color.fromRGBO(29, 27, 32, 0.12);
}
