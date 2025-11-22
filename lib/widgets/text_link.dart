import 'package:flutter/material.dart';
import '../constants/app_text_styles.dart';

class TextLink extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final TextStyle? style;
  final bool underline;

  const TextLink({
    super.key,
    required this.text,
    required this.onTap,
    this.style,
    this.underline = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        style: style ?? (underline ? AppTextStyles.link : AppTextStyles.linkBold),
      ),
    );
  }
}
