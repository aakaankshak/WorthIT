import 'package:flutter/material.dart';
import '../features/splash/splash.dart';
import '../features/auth/welcome_screen.dart';
import '../features/product_analysis/product_analysis_screen.dart';
import '../features/loading/loading_screen.dart';
import '../features/result/result_screen.dart';
import '../features/result/comparison_result_screen.dart';

class AppRoutes {
  static const splash = '/';
  static const welcome = '/welcome';
  static const analyze = '/product-analysis';
  static const loading = '/loading';
  static const result = '/result';
  // 1. Add the new route constant
  static const comparison = '/comparison';

  static Map<String, WidgetBuilder> get routes => {
    splash: (_) => const SplashScreen(),
    welcome: (_) => const WelcomeScreen(),
    analyze: (_) => const ProductAnalysisScreen(),
    loading: (_) => const LoadingScreen(),
    result: (_) => const ResultScreen(),
    // 2. Register the new screen here
    comparison: (_) => const ComparisonResultScreen(),
  };
}
