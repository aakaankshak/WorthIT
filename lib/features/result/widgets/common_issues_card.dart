import 'package:flutter/material.dart';

class CommonIssuesCard extends StatelessWidget {
  const CommonIssuesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Common Issues',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            // Issue 1
            _buildIssueRow(
              icon: Icons.battery_alert,
              title: 'Battery Longevity',
              description: 'Capacity drops by ~15% after 400 charge cycles.',
            ),

            const SizedBox(height: 16),

            // Issue 2
            _buildIssueRow(
              icon: Icons.build_circle_outlined,
              title: 'Build Integrity',
              description:
                  'Minor creaking reported in the chassis over long-term use.',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIssueRow({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.purple.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: Colors.purple, size: 20),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                description,
                style: TextStyle(fontSize: 12, color: Colors.grey.shade700),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
