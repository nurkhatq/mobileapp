import 'package:flutter/material.dart';

class AppColors {
  static const primaryPurple = Color(0xFF7B68EE);
  static const primaryPink = Color(0xFFFF6B9D);
  static const accentOrange = Color(0xFFFF8C42);
  static const darkPurple = Color(0xFF5B4B8A);

  static const backgroundLight = Color(0xFFF8F9FA);
  static const backgroundDark = Color(0xFF1A1A2E);
  static const cardLight = Colors.white;
  static const cardDark = Color(0xFF16213E);

  static const textPrimary = Color(0xFF2D3142);
  static const textSecondary = Color(0xFF9F9F9F);
  static const textLight = Colors.white;

  static const success = Color(0xFF4CAF50);
  static const warning = Color(0xFFFF9800);
  static const error = Color(0xFFF44336);

  static const starColor = Color(0xFFFFD700);

  static LinearGradient primaryGradient = const LinearGradient(
    colors: [primaryPurple, primaryPink],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static LinearGradient accentGradient = const LinearGradient(
    colors: [accentOrange, primaryPink],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static Color hexToColor(String hex) {
    hex = hex.replaceAll('#', '');
    if (hex.length == 6) {
      hex = 'FF$hex';
    }
    return Color(int.parse(hex, radix: 16));
  }
}
