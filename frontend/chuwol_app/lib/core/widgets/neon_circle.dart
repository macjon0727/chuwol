import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class NeonCircle extends StatelessWidget {
  const NeonCircle({
    required this.child,
    this.size = 128,
    this.color = AppColors.neonLime,
    super.key,
  });

  final Widget child;
  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color.withValues(alpha: 0.1),
        border: Border.all(color: color, width: 2),
        boxShadow: [
          BoxShadow(color: color.withValues(alpha: 0.26), blurRadius: 28),
        ],
      ),
      alignment: Alignment.center,
      child: child,
    );
  }
}
