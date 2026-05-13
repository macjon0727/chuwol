import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class SecondaryCard extends StatelessWidget {
  const SecondaryCard({
    required this.child,
    this.padding = const EdgeInsets.all(18),
    this.onTap,
    super.key,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Ink(
        width: double.infinity,
        padding: padding,
        decoration: BoxDecoration(
          color: AppColors.card,
          border: Border.all(color: AppColors.border),
          borderRadius: BorderRadius.circular(20),
        ),
        child: child,
      ),
    );
  }
}
