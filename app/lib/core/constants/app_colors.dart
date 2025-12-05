import 'package:flutter/material.dart';

/// Application color palette - Dark gaming theme
class AppColors {
  AppColors._(); // Private constructor to prevent instantiation

  // Primary Colors
  static const Color primary = Color(0xFF9C4DFF); // Purple
  static const Color primaryDark = Color(0xFF7B3DCC);
  static const Color primaryLight = Color(0xFFB366FF);

  // Background Colors
  static const Color background = Colors.black;
  static const Color surface = Color(0xFF1A1A1A);
  static const Color surfaceLight = Color(0xFF2A2A2A);

  // Text Colors
  static const Color textPrimary = Colors.white;
  static const Color textSecondary = Colors.white70;
  static const Color textHint = Colors.grey;

  // UI Element Colors
  static const Color cardBackground = Color(0xFF212121);
  static const Color inputBackground = Color(0xFF2A2A2A);
  static const Color inputBorder = Colors.white24;
  static const Color inputFocusedBorder = primary;

  // Status Colors
  static const Color success = Colors.green;
  static const Color error = Colors.red;
  static const Color warning = Colors.orange;
  static const Color info = Colors.blue;

  // Additional Colors
  static const Color online = Colors.green;
  static const Color offline = Colors.grey;
  static const Color divider = Colors.white12;
  static const Color disabled = Colors.grey;

  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primary, primaryDark],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
