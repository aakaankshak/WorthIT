import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  final double size;
  final double fontSize;

  const LogoWidget({super.key, this.size = 60, this.fontSize = 24});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.purple.shade400, Colors.purple.shade600],
        ),
        borderRadius: BorderRadius.circular(size * 0.2),
      ),
      child: Center(
        child: Text(
          'Wi',
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
