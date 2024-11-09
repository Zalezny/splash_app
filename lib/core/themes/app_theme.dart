import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class AppTheme {
  static ThemeData get theme => ThemeData(
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor: AppColors.primary,
        textTheme: const TextTheme(
          // Styl dla głównych tytułów
          titleLarge: TextStyle(
            fontSize: 26,
            color: AppColors.textWhite,
            fontWeight: FontWeight.w400,
          ),
          // Styl dla pogrubionych tytułów
          titleMedium: TextStyle(
            fontSize: 26,
            color: AppColors.textWhite,
            fontWeight: FontWeight.bold,
          ),
          // Styl dla przycisków
          labelLarge: TextStyle(
            fontSize: 16,
            color: AppColors.textWhite,
            fontWeight: FontWeight.w600,
          ),
          // Styl dla przycisków pomocniczych (np. "Pomiń")
          labelMedium: TextStyle(
            fontSize: 16,
            color: AppColors.textWhite70,
            fontWeight: FontWeight.w600,
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: AppColors.textWhite70,
            padding: const EdgeInsets.symmetric(
              horizontal: 48,
              vertical: 16,
            ),
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryDark,
            padding: const EdgeInsets.symmetric(
              horizontal: 48,
              vertical: 16,
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
