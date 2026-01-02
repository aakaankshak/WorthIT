import 'package:flutter/material.dart';

class VerdictCard extends StatelessWidget {
  const VerdictCard({super.key});

  @override
  Widget build(BuildContext context) {
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
          Text(
            'Overall quality: Excellent',
            style: TextStyle(color: Colors.green.shade700),
          ),
          const SizedBox(height: 8),
          const Text(
            'This product scored high on reliability and performance.',
          ),
        ],
      ),
    );
  }
}
