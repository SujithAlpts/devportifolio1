import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryDark = Color(0xFFF8FAFC);
  static const Color secondaryDark = Color(0xFFE2E8F0);
  static const Color accentPurple = Color(0xFF3B82F6);
  static const Color accentBlue = Color(0xFF1E40AF);
  static const Color textPrimary = Color(0xFF1E293B);
  static const Color textSecondary = Color(0xFF64748B);
  static const Color textMuted = Color(0xFF94A3B8);
  static const Color cardBackground = Color(0xFFFFFFFF);
  static const Color borderColor = Color(0xFFE2E8F0);
  static const Color gradientStart = Color(0xFF3B82F6);
  static const Color gradientEnd = Color(0xFFEF4444);

  static LinearGradient get primaryGradient => const LinearGradient(
        colors: [gradientStart, gradientEnd],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );

  static LinearGradient get backgroundGradient => const LinearGradient(
        colors: [primaryDark, Color(0xFFF1F5F9)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      );
}

