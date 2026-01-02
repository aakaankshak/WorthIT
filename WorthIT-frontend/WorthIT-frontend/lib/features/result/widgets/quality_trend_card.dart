import 'package:flutter/material.dart';

class QualityTrendCard extends StatelessWidget {
  const QualityTrendCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0), // Tightened padding
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Quality Trend',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),

            // Reduced height to 75 to guarantee no overflow
            SizedBox(
              height: 75,
              width: double.infinity,
              child: CustomPaint(painter: TrendLinePainter()),
            ),

            const Padding(
              padding: EdgeInsets.only(top: 6.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '2023',
                    style: TextStyle(fontSize: 9, color: Colors.grey),
                  ),
                  Text(
                    '2024',
                    style: TextStyle(fontSize: 9, color: Colors.grey),
                  ),
                  Text(
                    '2025',
                    style: TextStyle(fontSize: 9, color: Colors.grey),
                  ),
                  Text(
                    'Current',
                    style: TextStyle(
                      fontSize: 9,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TrendLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paintPurple = Paint()
      ..color = Colors.purple
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final pathPurple = Path()
      ..moveTo(0, size.height * 0.8)
      ..lineTo(size.width * 0.3, size.height * 0.6)
      ..lineTo(size.width * 0.6, size.height * 0.65)
      ..lineTo(size.width, size.height * 0.2);

    canvas.drawPath(pathPurple, paintPurple);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
