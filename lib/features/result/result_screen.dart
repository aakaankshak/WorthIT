import 'package:flutter/material.dart';
import 'widgets/verdict_card_widget.dart';
import 'widgets/quality_trend_card.dart';
import 'widgets/common_issues_card.dart';
import '../../core/widgets/primary_button.dart';
import '../../core/widgets/outlined_primary_button.dart';
import '../../core/widgets/logo_widget.dart';
import '../../navigation/app_routes.dart';
import '../loading/loading_screen.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  void _showVerdictExplanation(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 450),
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Verdict Analysis',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  _buildBullet(
                    'Market Comparison',
                    'Priced 15% lower than competitors.',
                  ),
                  _buildBullet(
                    'Durability Score',
                    'Build quality remains stable after 2 years.',
                  ),
                  _buildBullet(
                    'Feature Value',
                    'Battery life is top-tier for this price bracket.',
                  ),
                  const SizedBox(height: 20),
                  PrimaryButton(
                    label: 'Got it',
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildBullet(String title, String desc) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '• ',
            style: TextStyle(fontSize: 18, color: Colors.purple),
          ),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                  height: 1.3,
                ),
                children: [
                  TextSpan(
                    text: '$title: ',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: desc),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final String productName =
        ModalRoute.of(context)?.settings.arguments as String? ?? "Product";

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 450),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                // Use mainAxisAlignment.spaceEvenly to distribute space perfectly
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(height: 5),
                  const LogoWidget(size: 30, fontSize: 18),

                  Text(
                    'Analysis for $productName',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple,
                    ),
                  ),

                  // Wrap cards in Flexible so they shrink if the screen is too short
                  const Flexible(child: VerdictCard()),

                  const Flexible(child: QualityTrendCard()),

                  const Flexible(child: CommonIssuesCard()),

                  Column(
                    children: [
                      PrimaryButton(
                        label: 'Why this verdict?',
                        onPressed: () => _showVerdictExplanation(context),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: OutlinedPrimaryButton(
                              label: 'Compare',
                              onPressed: () {
                                LoadingScreen.isCompareMode = true;
                                Navigator.pushNamed(context, AppRoutes.analyze);
                              },
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: OutlinedPrimaryButton(
                              label: 'Save',
                              onPressed: () =>
                                  Navigator.pushNamedAndRemoveUntil(
                                    context,
                                    AppRoutes.welcome,
                                    (route) => false,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
