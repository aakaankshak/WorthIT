import 'package:flutter/material.dart';
import 'loading_painter.dart';
import '../../navigation/app_routes.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  // Flag to check if we should go to Comparison instead of Result
  static bool isCompareMode = false;
  // Store the first product name for comparison
  static String firstProductName = "";

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..addListener(() => setState(() {}));

    _controller.forward().then((_) async {
      // Catch the name passed from Analysis Screen
      final String currentProduct =
          ModalRoute.of(context)?.settings.arguments as String? ?? "Product";

      await Future.delayed(const Duration(milliseconds: 500));
      if (!mounted) return;

      if (LoadingScreen.isCompareMode) {
        LoadingScreen.isCompareMode = false; // Reset for next time
        Navigator.pushReplacementNamed(
          context,
          AppRoutes.comparison,
          arguments: {
            "p1": LoadingScreen.firstProductName,
            "p2": currentProduct,
          },
        );
      } else {
        LoadingScreen.firstProductName =
            currentProduct; // Save for potential comparison
        Navigator.pushReplacementNamed(
          context,
          AppRoutes.result,
          arguments: currentProduct,
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 200,
              height: 200,
              child: CustomPaint(
                painter: LoadingPainter(progress: _controller.value),
              ),
            ),
            const SizedBox(height: 40),
            const Text(
              'Analyzing Product...',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.purple,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
