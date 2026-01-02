import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';
import '../navigation/app_routes.dart';

class WorthITApp extends StatelessWidget {
  const WorthITApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WorthIT',
      theme: AppTheme.lightTheme,
      initialRoute: AppRoutes.splash,
      routes: AppRoutes.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
