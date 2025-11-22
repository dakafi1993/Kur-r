import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_gradients.dart';
import '../constants/app_spacing.dart';
import '../constants/app_radius.dart';
import '../constants/app_shadows.dart';
import '../constants/app_text_styles.dart';
import '../constants/app_font_sizes.dart';

class GradientHeader extends StatelessWidget {
  final String title;
  final double height;
  final bool showLogo;

  const GradientHeader({
    super.key,
    required this.title,
    this.height = 280,
    this.showLogo = true,
  });

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;

    return Container(
      width: double.infinity,
      height: height,
      decoration: const BoxDecoration(
        gradient: AppGradients.header,
      ),
      child: Column(
        children: [
          SizedBox(height: topPadding + AppSpacing.xLarge),
          if (showLogo)
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(AppRadius.xLarge),
                boxShadow: [AppShadows.logo],
              ),
              child: Center(
                child: Text(
                  'K',
                  style: AppTextStyles.heading1.copyWith(
                    color: AppColors.primary,
                    fontSize: AppFontSizes.massive,
                  ),
                ),
              ),
            ),
          const SizedBox(height: AppSpacing.large),
          Text(
            title,
            style: AppTextStyles.heading1,
          ),
        ],
      ),
    );
  }
}
