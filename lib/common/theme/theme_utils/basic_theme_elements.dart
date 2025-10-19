import 'package:flutter/material.dart';

abstract class BaseTheme {
  static const double unit = 8;
  static const double padding = unit * 2;
  static const double buttonRadius = 40;
  static const double borderRadius = 12;
  static const double size = 10;
  static const double verticlePaddingBtn = 10;
  static const double horizontalPaddingBtn = 24;
  static const EdgeInsetsGeometry screenPadding = EdgeInsets.symmetric(
    vertical: padding,
    horizontal: 18,
  );

  static const circularRadius = Radius.circular(buttonRadius);

  // Theme independent colors
  static const Color iconColor = Color(0xFF878787);

  // Shadows
  static final defaultShadow = BoxShadow(
    offset: const Offset(0, 0),
    blurRadius: 24,
    color: Colors.black.withOpacity(0),
  );
}
