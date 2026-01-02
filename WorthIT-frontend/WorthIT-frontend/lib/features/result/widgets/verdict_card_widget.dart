import 'package:flutter/material.dart';

class VerdictCard extends StatelessWidget {
  final String verdict;
  final double confidence;

  const VerdictCard({
    super.key,
    required this.verdict,
    required this.confidence,
  });

  @override
  Widget build(BuildContext context) {
    final bool isPositive = verdict.toUpperCase() == 'YES';

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Verdict',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),

          // 🔹 Verdict text
          Text(
            isPositive ? 'Worth Buying' : 'Not Recommended',
            style: TextStyle(
              color: isPositive ? Colors.green.shade700 : Colors.red.shade700,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          // 🔹 Confidence
          Text(
            'Confidence: ${(confidence * 100).toStringAsFixed(0)}%',
            style: const TextStyle(fontSize: 13),
          ),
        ],
      ),
    );
  }
}
