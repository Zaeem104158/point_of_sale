import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
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
}
