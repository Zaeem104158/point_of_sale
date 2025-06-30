import 'package:flutter/material.dart';
import 'package:point_of_sale/src/core/style/app_color.dart';

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
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontSize: 48,
          fontWeight: FontWeight.bold,
          color: AppColor.darkText,
        ),
        displayMedium: TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.bold,
          color: AppColor.darkText,
        ),
        displaySmall: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w600,
          color: AppColor.darkText,
        ),
        headlineLarge: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: AppColor.darkText,
        ),
        headlineMedium: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: AppColor.darkText,
        ),
        headlineSmall: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: AppColor.darkText,
        ),
        titleLarge: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: AppColor.primary,
        ),
        titleMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: AppColor.darkText,
        ),
        titleSmall: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: AppColor.darkText,
        ),
        bodyLarge: TextStyle(fontSize: 16, color: AppColor.darkText),
        bodyMedium: TextStyle(fontSize: 14, color: AppColor.darkText),
        bodySmall: TextStyle(fontSize: 12, color: AppColor.darkText),
        labelLarge: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: AppColor.darkText,
        ),
        labelMedium: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: AppColor.darkText,
        ),
        labelSmall: TextStyle(fontSize: 10, color: AppColor.darkText),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.primary,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      cardTheme: const CardThemeData(
        color: AppColor.cardLight,
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: AppColor.primary,
        unselectedItemColor: Colors.grey,
      ),
      navigationBarTheme: NavigationBarThemeData(
        height: kBottomNavigationBarHeight,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        labelTextStyle: WidgetStatePropertyAll(
          TextStyle(color: AppColor.darkText, fontWeight: FontWeight.bold),
        ),
        indicatorColor: AppColor.primary.withOpacity(0.5),
        backgroundColor: AppColor.lightBackground,
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
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontSize: 48,
          fontWeight: FontWeight.bold,
          color: AppColor.lightText,
        ),
        displayMedium: TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.bold,
          color: AppColor.lightText,
        ),
        displaySmall: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w600,
          color: AppColor.lightText,
        ),
        headlineLarge: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: AppColor.lightText,
        ),
        headlineMedium: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: AppColor.lightText,
        ),
        headlineSmall: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: AppColor.lightText,
        ),
        titleLarge: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: AppColor.accent,
        ),
        titleMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: AppColor.lightText,
        ),
        titleSmall: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: AppColor.lightText,
        ),
        bodyLarge: TextStyle(fontSize: 16, color: AppColor.lightText),
        bodyMedium: TextStyle(fontSize: 14, color: AppColor.lightText),
        bodySmall: TextStyle(fontSize: 12, color: AppColor.lightText),
        labelLarge: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: AppColor.lightText,
        ),
        labelMedium: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: AppColor.lightText,
        ),
        labelSmall: TextStyle(fontSize: 10, color: AppColor.lightText),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.accent,
          foregroundColor: Colors.black,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      cardTheme: const CardThemeData(
        color: AppColor.cardDark,
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColor.darkBackground,
        selectedItemColor: AppColor.accent,
        unselectedItemColor: Colors.grey,
      ),
      navigationBarTheme: NavigationBarThemeData(
        height: kBottomNavigationBarHeight,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        labelTextStyle: WidgetStatePropertyAll(
          TextStyle(color: AppColor.lightText, fontWeight: FontWeight.bold),
        ),
        indicatorColor: AppColor.primary,
        backgroundColor: AppColor.darkBackground,
      ),
    );
  }
}
