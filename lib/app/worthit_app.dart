import 'package:flutter/material.dart';
import '../navigation/app_routes.dart';

class WorthITApp extends StatelessWidget {
  const WorthITApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WorthIT',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFA78BFA),
          primary: const Color(0xFFA78BFA),
          onPrimary: Colors.white,
          surface: Colors.white,
        ),

        fontFamily: 'Plus Jakarta Sans',

        cardTheme: CardThemeData(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
            side: BorderSide(color: Colors.grey.withOpacity(0.1)),
          ),
        ),

        chipTheme: ChipThemeData(
          backgroundColor: Colors.grey.shade50,
          selectedColor: Color(0xFFA78BFA).withOpacity(0.2),
          secondarySelectedColor: const Color(0xFFA78BFA),
          labelStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          side: BorderSide.none,
        ),
      ), // Fixed: Properly closed ThemeData

      initialRoute: AppRoutes.splash,
      routes: AppRoutes.routes,
    ); // Fixed: Properly closed MaterialApp
  }
}
