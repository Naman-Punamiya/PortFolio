import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_radius.dart';
import 'app_spacing.dart';
import 'app_text_styles.dart';

class AppTheme {
  AppTheme._();

  // =========================
  // Light Theme
  // =========================

  static ThemeData get lightTheme => ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,

        scaffoldBackgroundColor: AppColors.background,

        textTheme: TextTheme(
          displayLarge: AppTextStyles.display,
          headlineMedium: AppTextStyles.heading,
          titleLarge: AppTextStyles.title,
          titleMedium: AppTextStyles.nav,
          bodyMedium: AppTextStyles.body,
          bodySmall: AppTextStyles.caption,
          labelLarge: AppTextStyles.button,
        ),

        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          brightness: Brightness.light,
        ),

        appBarTheme: const AppBarTheme(
          elevation: 0,
          centerTitle: false,
          backgroundColor: Colors.transparent,
        ),

        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: AppColors.card,
          contentPadding: const EdgeInsets.all(AppSpacing.md),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppRadius.sm),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppRadius.sm),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppRadius.sm),
            borderSide: const BorderSide(
              color: AppColors.primary,
              width: 1.5,
            ),
          ),
        ),

        cardTheme: const CardThemeData(
          elevation: 0,
          color: AppColors.card,
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            foregroundColor: AppColors.card,
            elevation: 0,
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.lg,
              vertical: AppSpacing.md,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppRadius.md),
            ),
            textStyle: AppTextStyles.button,
          ),
        ),

        dividerColor: AppColors.border,
      );

  // =========================
  // Dark Theme
  // =========================

  static ThemeData get darkTheme => ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,

        scaffoldBackgroundColor: AppColors.darkBackground,

        textTheme: TextTheme(
          displayLarge: AppTextStyles.display.copyWith(
            color: AppColors.darkTextPrimary,
          ),
          headlineMedium: AppTextStyles.heading.copyWith(
            color: AppColors.darkTextPrimary,
          ),
          titleLarge: AppTextStyles.title.copyWith(
            color: AppColors.darkTextPrimary,
          ),
          titleMedium: AppTextStyles.nav.copyWith(
            color: AppColors.darkTextPrimary,
          ),
          bodyMedium: AppTextStyles.body.copyWith(
            color: AppColors.darkTextSecondary,
          ),
          bodySmall: AppTextStyles.caption.copyWith(
            color: AppColors.darkTextSecondary,
          ),
          labelLarge: AppTextStyles.button.copyWith(
            color: AppColors.darkTextPrimary,
          ),
        ),

        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.darkPrimary,
          brightness: Brightness.dark,
        ),

        appBarTheme: const AppBarTheme(
          elevation: 0,
          centerTitle: false,
          backgroundColor: Colors.transparent,
        ),

        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: AppColors.darkCard,
          contentPadding: const EdgeInsets.all(AppSpacing.md),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppRadius.sm),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppRadius.sm),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppRadius.sm),
            borderSide: const BorderSide(
              color: AppColors.darkPrimary,
              width: 1.5,
            ),
          ),
        ),

        cardTheme: const CardThemeData(
          elevation: 0,
          color: AppColors.darkCard,
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.darkPrimary,
            foregroundColor: AppColors.darkTextPrimary,
            elevation: 0,
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.lg,
              vertical: AppSpacing.md,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppRadius.md),
            ),
            textStyle: AppTextStyles.button.copyWith(
              color: AppColors.darkTextPrimary,
            ),
          ),
        ),

        dividerColor: AppColors.darkBorder,
      );
}