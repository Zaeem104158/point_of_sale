import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:point_of_sale/src/core/style/app_color.dart';

@lazySingleton
class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColor.lightBackground,
      primaryColor: AppColor.primary,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColor.lightBackground,
        foregroundColor: AppColor.darkText,
        elevation: 0,
      ),
      tabBarTheme: TabBarThemeData(
        labelColor: AppColor.primary,
        unselectedLabelColor: Colors.grey[600],
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(color: AppColor.primary, width: 2),
        ),
      ),
      textTheme: TextTheme(
        bodyLarge: TextStyle(color: AppColor.darkText),
        bodyMedium: TextStyle(color: AppColor.darkText),
        titleLarge: TextStyle(
          color: AppColor.primary,
          fontWeight: FontWeight.bold,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.primary,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      cardTheme: CardThemeData(
        color: AppColor.cardLight,
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: AppColor.primary,
        unselectedItemColor: Colors.grey,
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColor.darkBackground,
      primaryColor: AppColor.accent,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColor.darkBackground,
        foregroundColor: AppColor.lightText,
        elevation: 0,
      ),
      tabBarTheme: TabBarThemeData(
        labelColor: AppColor.accent,
        unselectedLabelColor: Colors.grey[400],
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(color: AppColor.accent, width: 2),
        ),
      ),
      textTheme: TextTheme(
        bodyLarge: TextStyle(color: AppColor.lightText),
        bodyMedium: TextStyle(color: AppColor.lightText),
        titleLarge: TextStyle(
          color: AppColor.accent,
          fontWeight: FontWeight.bold,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.accent,
          foregroundColor: Colors.black,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      cardTheme: CardThemeData(
        color: AppColor.cardDark,
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColor.darkBackground,
        selectedItemColor: AppColor.accent,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}
