import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_spacing.dart';
import '../constants/app_radius.dart';
import '../constants/app_shadows.dart';

class LoginCard extends StatelessWidget {
  final Widget child;

  const LoginCard({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 210,
      left: AppSpacing.xxLarge,
      right: AppSpacing.xxLarge,
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.xxLarge),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppRadius.large),
          boxShadow: [AppShadows.card],
        ),
        child: child,
      ),
    );
  }
}
