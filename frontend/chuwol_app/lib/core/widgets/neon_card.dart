import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class NeonCard extends StatelessWidget {
  const NeonCard({required this.child, this.onTap, super.key});

  final Widget child;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Ink(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.card,
          border: Border.all(color: AppColors.neonLime, width: 1.4),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: AppColors.neonLime.withValues(alpha: 0.2),
              blurRadius: 20,
              spreadRadius: 1,
            ),
          ],
        ),
        child: child,
      ),
    );
  }
}
