import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // =========================
  // Light Theme
  // =========================

  static const background = Color(0xFFF8FAF7);
  static const card = Color(0xFFFFFFFF);

  static const primary = Color(0xFF3F7D58);
  static const secondary = Color(0xFF6A9C89);

  static const border = Color(0xFFE5E7EB);

  static const textPrimary = Color(0xFF1F2937);
  static const textSecondary = Color(0xFF6B7280);

  // =========================
  // Dark Theme
  // =========================

  static const darkBackground = Color(0xFF0F172A);
  static const darkCard = Color(0xFF1E293B);

  // You can keep the same primary colors
  static const darkPrimary = primary;
  static const darkSecondary = secondary;

  static const darkBorder = Color(0xFF334155);

  static const darkTextPrimary = Color(0xFFF8FAFC);
  static const darkTextSecondary = Color(0xFFCBD5E1);
}