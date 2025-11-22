import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_radius.dart';
import 'app_spacing.dart';

/// Input decoration styles
class AppInputDecorations {
  // Prevent instantiation
  AppInputDecorations._();
  
  static InputDecoration standard({
    required String hintText,
    Widget? prefixIcon,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: const TextStyle(color: AppColors.grey),
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      filled: true,
      fillColor: AppColors.white,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.large,
        vertical: 14,
      ),
      border: _border(AppColors.borderGrey),
      enabledBorder: _border(AppColors.borderGrey),
      focusedBorder: _border(AppColors.primary),
      errorBorder: _border(Colors.red),
      focusedErrorBorder: _border(Colors.red),
    );
  }
  
  static OutlineInputBorder _border(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppRadius.large),
      borderSide: BorderSide(color: color, width: 2),
    );
  }
}
