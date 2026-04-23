import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/core/theme/app_colors.dart';

class AppTheme {
  static TextTheme get _textTheme => TextTheme(
    // Titulos grandes
    displayLarge: TextStyle(
      fontFamily: 'PlusJakarta',
      fontSize: 56, // 3.5rem
      fontWeight: FontWeight.bold,
      letterSpacing: -0.5,
      color: AppColors.primary,
    ),

    displayMedium: TextStyle(
      fontFamily: 'PlusJakarta',
      fontSize: 48, // 3.5rem
      fontWeight: FontWeight.bold,
      letterSpacing: -0.5,
      color: AppColors.primary,
    ),

    // Titulos
    titleLarge: TextStyle(
      fontFamily: 'PlusJakarta',
      fontSize: 27,
      fontWeight: FontWeight.bold,
      color: AppColors.primary,
    ),

    titleMedium: TextStyle(
      fontFamily: 'PlusJakarta',
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: AppColors.primary,
    ),

    titleSmall: TextStyle(
      fontFamily: 'PlusJakarta',
      fontSize: 15,
      fontWeight: FontWeight.bold,
      color: AppColors.primary,
    ),

    // Texto principal
    bodyMedium: TextStyle(
      fontFamily: 'Inter',
      fontSize: 14,
      color: AppColors.onSurface.withValues(alpha: 0.85),
    ),

    // Labels
    labelMedium: TextStyle(
      fontFamily: 'Inter',
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: AppColors.onSurface,
    ),
  );

  static ThemeData get appTheme => ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,

    colorScheme: ColorScheme.light(
      brightness: Brightness.light,

      primary: AppColors.primary,
      onPrimary: Colors.white,

      secondary: AppColors.secondary,
      onSecondary: Colors.white,
      secondaryContainer: AppColors.secondaryContainer,
      onSecondaryContainer: Color(0xFF2B1237),

      tertiary: AppColors.tertiary,
      onTertiary: Color(0xFF2B2000),

      surface: AppColors.surface,
      onSurface: AppColors.onSurface,

      surfaceContainerLow: AppColors.surfaceContainerLow,
      surfaceContainer: AppColors.surfaceContainer,
      surfaceContainerHigh: AppColors.surfaceContainerHigh,
      surfaceContainerHighest: AppColors.surfaceContainerHighest,
      onSurfaceVariant: AppColors.onSurfaceVariant,

      outline: Colors.transparent,
      outlineVariant: Colors.transparent,
    ),

    textTheme: _textTheme,

    cardTheme: CardThemeData(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      elevation: 0,
    ),

    chipTheme: ChipThemeData(
      backgroundColor: AppColors.surfaceVariant,
      labelStyle: _textTheme.labelMedium?.copyWith(
        fontWeight: FontWeight.bold,
        color: AppColors.primary,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
    ),

    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: AppColors.success,
      linearTrackColor: AppColors.surfaceVariant,
      borderRadius: BorderRadius.circular(30),
      linearMinHeight: 15,
    ),

    filledButtonTheme: FilledButtonThemeData(
      style: ButtonStyle(
        // backgroundColor: WidgetStatePropertyAll(AppColors.tertiaryContainer),
        // foregroundColor: WidgetStatePropertyAll(Colors.black),
        padding: WidgetStatePropertyAll(EdgeInsets.symmetric(vertical: 14)),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    ),
  );
}
