import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_font_sizes.dart';

class RichTextLink extends StatelessWidget {
  final String normalText;
  final String linkText;
  final VoidCallback onTap;

  const RichTextLink({
    super.key,
    required this.normalText,
    required this.linkText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: RichText(
        text: TextSpan(
          style: const TextStyle(
            fontSize: AppFontSizes.regular,
            color: AppColors.black,
          ),
          children: [
            TextSpan(text: normalText),
            TextSpan(
              text: linkText,
              style: const TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
