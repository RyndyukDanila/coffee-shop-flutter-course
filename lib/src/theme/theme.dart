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
    titleMedium: TextStyle(
      fontFamily: "Roboto",
      fontSize: 32,
      fontWeight: FontWeight.w600,
      letterSpacing: 0,
    ),
  ),
);
