import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_font_sizes.dart';

/// Text styles for consistent typography
class AppTextStyles {
  // Prevent instantiation
  AppTextStyles._();
  
  // Headings
  static const TextStyle h1 = TextStyle(
    fontSize: AppFontSizes.xxxLarge,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
  );
  
  static const TextStyle heading1 = TextStyle(
    fontSize: AppFontSizes.xxxLarge,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
  );
  
  static const TextStyle heading2 = TextStyle(
    fontSize: AppFontSizes.xxLarge,
    fontWeight: FontWeight.bold,
    color: AppColors.black,
  );
  
  static const TextStyle heading3 = TextStyle(
    fontSize: AppFontSizes.xLarge,
    fontWeight: FontWeight.w600,
    color: AppColors.black,
  );
  
  // Body text
  static const TextStyle body = TextStyle(
    fontSize: AppFontSizes.regular,
    color: AppColors.black,
  );
  
  static const TextStyle bodyLarge = TextStyle(
    fontSize: AppFontSizes.large,
    color: AppColors.black,
  );
  
  static const TextStyle subtitle = TextStyle(
    fontSize: AppFontSizes.regular,
    fontWeight: FontWeight.w600,
    color: AppColors.black,
  );
  
  static const TextStyle caption = TextStyle(
    fontSize: AppFontSizes.small,
    color: AppColors.grey,
  );
  
  static const TextStyle bodyMedium = TextStyle(
    fontSize: AppFontSizes.medium,
    fontWeight: FontWeight.w600,
    color: AppColors.black,
  );
  
  static const TextStyle bodySmall = TextStyle(
    fontSize: AppFontSizes.regular,
    color: AppColors.grey,
  );
  
  // Labels
  static const TextStyle label = TextStyle(
    fontSize: AppFontSizes.regular,
    fontWeight: FontWeight.w500,
    color: AppColors.grey,
  );
  
  static const TextStyle labelBold = TextStyle(
    fontSize: AppFontSizes.regular,
    fontWeight: FontWeight.w600,
    color: AppColors.black,
  );
  
  // Button text
  static const TextStyle button = TextStyle(
    fontSize: AppFontSizes.large,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );
  
  // Link text
  static const TextStyle link = TextStyle(
    fontSize: AppFontSizes.regular,
    color: AppColors.primary,
    decoration: TextDecoration.underline,
  );
  
  static const TextStyle linkBold = TextStyle(
    fontSize: AppFontSizes.regular,
    color: AppColors.primary,
    fontWeight: FontWeight.w600,
  );
}
