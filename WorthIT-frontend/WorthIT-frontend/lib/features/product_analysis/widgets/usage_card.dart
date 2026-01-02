import 'package:flutter/material.dart';

class UsageCard extends StatefulWidget {
  const UsageCard({super.key});

  @override
  State<UsageCard> createState() => _UsageCardState();
}

class _UsageCardState extends State<UsageCard> {
  double _currentValue = 1.0; // 0 = Light, 1 = Moderate, 2 = Heavy

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.grey.shade50,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Slider(
              value: _currentValue,
              min: 0,
              max: 2,
              divisions: 2,
              activeColor: Colors.purple,
              inactiveColor: Colors.purple.shade100,
              // This function makes the lever move
              onChanged: (double value) {
                setState(() {
                  _currentValue = value;
                });
              },
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Light', style: TextStyle(fontSize: 12)),
                  Text('Moderate', style: TextStyle(fontSize: 12)),
                  Text('Heavy', style: TextStyle(fontSize: 12)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
