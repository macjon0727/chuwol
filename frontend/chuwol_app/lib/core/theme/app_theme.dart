import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.black,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.neonLime,
        secondary: AppColors.goldTier,
        error: AppColors.redAlert,
        surface: AppColors.card,
        onPrimary: AppColors.black,
        onSurface: AppColors.whiteText,
      ),
      fontFamily: 'Roboto',
      textTheme:
          const TextTheme(
            displayLarge: TextStyle(fontSize: 48, fontWeight: FontWeight.w900),
            headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.w900),
            headlineMedium: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w800,
            ),
            titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
            titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            labelLarge: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
          ).apply(
            bodyColor: AppColors.whiteText,
            displayColor: AppColors.whiteText,
          ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.black,
        foregroundColor: AppColors.whiteText,
        centerTitle: false,
        elevation: 0,
        titleTextStyle: TextStyle(
          color: AppColors.whiteText,
          fontSize: 20,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}
