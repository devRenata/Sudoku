import 'package:flutter/material.dart';
import 'package:sudoku/src/presentation/design_system/app_colors.dart';

class AppTheme {
  static ThemeData get light {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.lightBackground,
      primaryColor: AppColors.darkBlue,
    );
  }
}