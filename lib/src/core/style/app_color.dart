import 'package:flutter/material.dart';

class AppColor {
  // Common
  static const Color primary = Color(0xFF007D9C); // bluish-teal
  static const Color accent = Color(0xFF2ED0A0); // mint green
  static const Color darkBackground = Color(0xFF1C2B36); // navy tone
  static const Color lightBackground = Color(0xFFFDFDFD);
  static const Color darkText = Color(0xFF1A1A1A);
  static const Color lightText = Color(0xFFFDFDFD);

  // Shades
  static const Color primaryDark = Color(0xFF005C78);
  static const Color cardLight = Color(0xFFF5F5F5);
  static const Color cardDark = Color(0xFF263238);

 // Solid Color List for Light Mode
  static const List<Color> solidLightColors = [
    Color(0xFFE57373), // red
    Color(0xFFBA68C8), // purple
    Color(0xFF64B5F6), // blue
    Color(0xFF4DB6AC), // teal
    Color(0xFFFFB74D), // orange
    Color(0xFFAED581), // light green
    Color(0xFFFF8A65), // deep orange
    Color(0xFF90A4AE), // blue grey
  ];

  // Solid Color List for Dark Mode
  static const List<Color> solidDarkColors = [
    Color(0xFFEF9A9A), // light red
    Color(0xFFD1C4E9), // light purple
    Color(0xFF90CAF9), // light blue
    Color(0xFF80CBC4), // light teal
    Color(0xFFFFCC80), // light orange
    Color(0xFFC5E1A5), // greenish
    Color(0xFFFFAB91), // light deep orange
    Color(0xFFB0BEC5), // grey-blue
  ];
}
