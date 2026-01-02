import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.background,
      primarySwatch: Colors.deepPurple,
      fontFamily: 'System',
    );
  }
}
