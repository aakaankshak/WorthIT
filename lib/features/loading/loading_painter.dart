import 'package:flutter/material.dart';

class LoadingPainter extends CustomPainter {
  final double progress;

  // The curly braces { } make 'progress' a named argument
  LoadingPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 20;

    // Background Glow
    final glowPaint = Paint()
      ..color = Colors.purple.shade300.withValues(alpha: 0.3)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 30);

    canvas.drawCircle(center, radius + 20, glowPaint);

    // Inner Glow
    final innerGlowPaint = Paint()
      ..color = Colors.purple.shade400.withValues(alpha: 0.5)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 15);

    canvas.drawCircle(center, radius, innerGlowPaint);

    // Animated Purple Arc
    final arcPaint = Paint()
      ..color = Colors.purple
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -1.5708, // Start at top (90 degrees)
      6.2831 * progress, // Draw based on 0.0 to 1.0 progress
      false,
      arcPaint,
    );
  }

  @override
  bool shouldRepaint(covariant LoadingPainter oldDelegate) =>
      oldDelegate.progress != progress;
}
