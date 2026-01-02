import 'package:flutter/material.dart';

class CommonIssuesCard extends StatelessWidget {
  final List<String> issues;

  const CommonIssuesCard({
    super.key,
    required this.issues,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Common Issues',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            // 🔹 No issues case
            if (issues.isEmpty)
              const Text(
                'No major issues reported.',
                style: TextStyle(fontSize: 12, color: Colors.green),
              ),

            // 🔹 Issues list
            ...issues.map(
              (issue) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: _buildIssueRow(
                  icon: Icons.warning_amber_rounded,
                  title: issue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIssueRow({
    required IconData icon,
    required String title,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: Colors.purple, size: 18),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            title,
            style: TextStyle(fontSize: 11, color: Colors.grey.shade700),
          ),
        ),
      ],
    );
  }
}
