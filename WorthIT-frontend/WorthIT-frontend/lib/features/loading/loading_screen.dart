import 'package:flutter/material.dart';
import 'loading_painter.dart';
import '../../navigation/app_routes.dart';
import '../../core/services/api_service.dart';
import '../../core/models/evaluation_result.dart';

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
  bool _called = false;

  @override
  void initState() {
    super.initState();

    // 🔹 Animation setup (UNCHANGED)
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..addListener(() => setState(() {}));

    _controller.forward();
  }

  // 🔹 BACKEND INTEGRATION (outside build)
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_called) return;
    _called = true;

    _analyzeProduct();
  }

  Future<void> _analyzeProduct() async {
    // Get product name from previous screen
    final String currentProduct =
        ModalRoute.of(context)?.settings.arguments as String? ?? "Product";

    try {
      // 🔹 Call backend
      final EvaluationResult result =
          await ApiService.evaluateProduct(
        productName: currentProduct,
      );

      if (!mounted) return;

      // 🔹 Comparison flow (kept intact)
      if (LoadingScreen.isCompareMode) {
        LoadingScreen.isCompareMode = false;

        Navigator.pushReplacementNamed(
          context,
          AppRoutes.comparison,
          arguments: {
            "p1": LoadingScreen.firstProductName,
            "p2": currentProduct,
            "result": result,
          },
        );
      } else {
        LoadingScreen.firstProductName = currentProduct;

        Navigator.pushReplacementNamed(
          context,
          AppRoutes.result,
          arguments: result,
        );
      }
    } catch (e) {
      print('error: $e');
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to analyze product. Please try again.'),
        ),
      );

      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // 🔹 UI (100% UNCHANGED)
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
