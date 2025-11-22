import 'package:flutter/material.dart';
import '../constants/app_spacing.dart';

class BottomLinks extends StatelessWidget {
  final List<Widget> children;

  const BottomLinks({
    super.key,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 580,
      left: 0,
      right: 0,
      child: Column(
        children: children
            .expand((widget) => [
                  widget,
                  if (widget != children.last)
                    const SizedBox(height: AppSpacing.large),
                ])
            .toList(),
      ),
    );
  }
}
