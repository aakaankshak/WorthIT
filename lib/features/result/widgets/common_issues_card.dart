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
        padding: const EdgeInsets.all(10.0), // Reduced from 16 to 10
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Common Issues',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            _buildIssueRow(
              icon: Icons.battery_alert,
              title: 'Battery Longevity',
              description: 'Drops ~15% after 400 cycles.', // Shortened text
            ),

            const SizedBox(height: 8), // Reduced gap

            _buildIssueRow(
              icon: Icons.build_circle_outlined,
              title: 'Build Integrity',
              description:
                  'Minor creaking reported in chassis.', // Shortened text
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
        Icon(icon, color: Colors.purple, size: 18), // Smaller icon
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
              Text(
                description,
                style: TextStyle(fontSize: 11, color: Colors.grey.shade700),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
