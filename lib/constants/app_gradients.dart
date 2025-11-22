import 'package:flutter/material.dart';
import 'app_colors.dart';

/// Gradient constants for consistent styling
class AppGradients {
  // Prevent instantiation
  AppGradients._();
  
  // Primary gradient
  static const LinearGradient primary = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [AppColors.primary, AppColors.secondary],
  );
  
  // Header gradient
  static const LinearGradient header = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [AppColors.primary, AppColors.secondary],
  );
  
  // Button gradient
  static const LinearGradient button = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [AppColors.primary, AppColors.secondary],
  );
  
  // Card gradient
  static const LinearGradient card = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [AppColors.white, Color(0xFFFAFAFA)],
  );
}
