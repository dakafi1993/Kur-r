import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_icon_sizes.dart';

class PasswordToggleIcon extends StatelessWidget {
  final bool isVisible;
  final VoidCallback onToggle;

  const PasswordToggleIcon({
    super.key,
    required this.isVisible,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isVisible ? Icons.visibility_off : Icons.visibility,
        size: AppIconSizes.regular,
        color: AppColors.grey,
      ),
      onPressed: onToggle,
    );
  }
}
