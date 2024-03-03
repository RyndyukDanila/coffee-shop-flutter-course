import 'package:flutter/material.dart';
import 'package:flutter_course/src/theme/app_colors.dart';

final theme = ThemeData(
  scaffoldBackgroundColor: AppColors.background,
  cardTheme: CardTheme(
    color: AppColors.primary,
    shadowColor: AppColors.black.withOpacity(0.5),
    surfaceTintColor: AppColors.white,
  ),
  textTheme: const TextTheme(
    labelSmall: TextStyle(
      color: AppColors.black,
      fontFamily: "Roboto",
      fontSize: 14,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25,
    ),
    labelMedium: TextStyle(
      color: AppColors.white,
      fontFamily: "Roboto",
      fontSize: 14,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25,
    ),
    titleSmall: TextStyle(
        color: AppColors.white,
        fontFamily: "Roboto",
        fontSize: 12,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.4),
    titleMedium: TextStyle(
      color: AppColors.black,
      fontFamily: "Roboto",
      fontSize: 16,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.15,
    ),
    titleLarge: TextStyle(
      color: AppColors.black,
      fontFamily: "Roboto",
      fontSize: 32,
      fontWeight: FontWeight.w600,
      letterSpacing: 0,
    ),
  ),
);
