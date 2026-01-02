import 'package:flutter/material.dart';
import '../../core/widgets/primary_button.dart';
import '../../core/widgets/logo_widget.dart';
import '../../navigation/app_routes.dart';
import '../../core/models/evaluation_result.dart';

class ComparisonResultScreen extends StatelessWidget {
  const ComparisonResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    final String p1 = args?['p1'] ?? 'Product A';
    final String p2 = args?['p2'] ?? 'Product B';
    final EvaluationResult? result = args?['result'];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 450),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const LogoWidget(size: 30, fontSize: 18),

                  const Text(
                    'Comparison Result',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  // 🔹 First product (baseline)
                  _buildComparisonCard(
                    title: p1,
                    verdict: 'Previously Analyzed',
                    description:
                        'This product was analyzed earlier and is used as the baseline.',
                    color: Colors.grey,
                  ),

                  const Icon(
                    Icons.swap_vert_circle,
                    color: Colors.purple,
                    size: 40,
                  ),

                  // 🔹 Second product (current backend result)
                  _buildComparisonCard(
                    title: p2,
                    verdict: result == null
                        ? 'No Data'
                        : (result.verdict == 'YES'
                            ? 'Better Choice'
                            : 'Not Recommended'),
                    description: result == null
                        ? 'No comparison data available.'
                        : (result.verdict == 'YES'
                            ? 'This product is a stronger match based on your priorities.'
                            : 'This product does not meet your requirements as well as the first one.'),
                    color: result == null
                        ? Colors.grey
                        : (result.verdict == 'YES'
                            ? Colors.green
                            : Colors.red),
                  ),

                  PrimaryButton(
                    label: 'Back to Home',
                    onPressed: () => Navigator.pushNamedAndRemoveUntil(
                      context,
                      AppRoutes.welcome,
                      (route) => false,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildComparisonCard({
    required String title,
    required String verdict,
    required String description,
    required Color color,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: color.withOpacity(0.3),
          width: 2,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            verdict,
            style: TextStyle(
              fontSize: 16,
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            description,
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey.shade700,
            ),
          ),
        ],
      ),
    );
  }
}
