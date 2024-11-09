import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class AppTheme {
  static ThemeData get theme => ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
        scaffoldBackgroundColor: AppColors.primary,
        useMaterial3: false,
        textTheme: const TextTheme(
          // Dla głównych nagłówków (pierwsza linia w splash)
          titleLarge: TextStyle(
            fontSize: 26,
            color: AppColors.textWhite,
            fontWeight: FontWeight.w400,
            height: 1.2,
          ),
          // Dla podtytułów (druga linia w splash)
          titleMedium: TextStyle(
            fontSize: 26,
            color: AppColors.textWhite,
            fontWeight: FontWeight.bold,
            height: 1.2,
          ),
          // Dla przycisków
          labelLarge: TextStyle(
            color: AppColors.textWhite,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          // Dla tekstu "Pomiń"
          labelMedium: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryDark,
            padding: const EdgeInsets.symmetric(
              horizontal: 48,
              vertical: 12,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
              side: const BorderSide(color: AppColors.borderWhite, width: 2),
            ),
            elevation: 0,
          ),
        ),
      );
}
