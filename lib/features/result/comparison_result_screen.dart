import 'package:flutter/material.dart';
import '../../core/widgets/primary_button.dart';
import '../../core/widgets/logo_widget.dart';
import '../../navigation/app_routes.dart';

class ComparisonResultScreen extends StatelessWidget {
  const ComparisonResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>?;
    final String p1 = args?['p1'] ?? "Samsung";
    final String p2 = args?['p2'] ?? "Vivo";

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
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),

                  // Samsung Card (Success)
                  _buildComparisonCard(
                    title: p1,
                    subtitle: 'Overall quality: Excellent',
                    desc: 'High reliability and performance.',
                    color: Colors.green,
                  ),

                  const Icon(
                    Icons.swap_vert_circle,
                    color: Colors.purple,
                    size: 40,
                  ),

                  // Vivo Card (Poor Match Logic)
                  _buildComparisonCard(
                    title: p2,
                    subtitle: p2.toLowerCase().contains('vivo')
                        ? 'Poor Match'
                        : 'Overall quality: Excellent',
                    desc: p2.toLowerCase().contains('vivo')
                        ? 'This product does not meet your durability and usage requirements.'
                        : 'Suitable match for your needs.',
                    color: p2.toLowerCase().contains('vivo')
                        ? Colors.red
                        : Colors.green,
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
    required String subtitle,
    required String desc,
    required Color color,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        // FIXED: Replaced withOpacity
        border: Border.all(color: color.withOpacity(0.3), width: 2),
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
            subtitle,
            style: TextStyle(
              fontSize: 16,
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            desc,
            style: TextStyle(fontSize: 13, color: Colors.grey.shade700),
          ),
        ],
      ),
    );
  }
}
