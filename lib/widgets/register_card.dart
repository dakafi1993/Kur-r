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
      offset: const Offset(0, -16),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(AppSpacing.xxLarge),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(AppRadius.xLarge),
            topRight: Radius.circular(AppRadius.xLarge),
          ),
          boxShadow: [AppShadows.card],
        ),
        child: child,
      ),
    );
  }
}
