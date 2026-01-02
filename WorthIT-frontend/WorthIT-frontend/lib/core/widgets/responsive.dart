import 'package:flutter/material.dart';

class Responsive {
  final BuildContext context;
  Responsive(this.context);

  /// Screen width
  double get width => MediaQuery.of(context).size.width;

  /// Screen height
  double get height => MediaQuery.of(context).size.height;

  /// Returns true if screen is considered compact (mobile)
  bool get isCompact => width < 380;

  /// Returns true if screen is considered medium (tablet portrait)
  bool get isMedium => width >= 380 && width < 800;

  /// Returns true if screen is considered large (tablet landscape / desktop)
  bool get isLarge => width >= 800;

  /// Scale a value based on screen width
  double scale(double value) => value * (width / 375);

  /// Example usage:
  /// Container(width: Responsive(context).scale(140))
}
