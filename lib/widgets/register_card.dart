import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_spacing.dart';
import '../constants/app_radius.dart';
import '../constants/app_shadows.dart';

class RegisterCard extends StatelessWidget {
  final Widget child;

  const RegisterCard({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(0, -40),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: AppSpacing.xxLarge),
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
