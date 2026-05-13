import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    required this.label,
    required this.onPressed,
    this.icon,
    super.key,
  });

  final String label;
  final VoidCallback onPressed;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: FilledButton.icon(
        onPressed: onPressed,
        icon: Icon(icon ?? Icons.arrow_forward, size: 20),
        label: Text(label),
        style: FilledButton.styleFrom(
          backgroundColor: AppColors.neonLime,
          foregroundColor: AppColors.black,
          elevation: 0,
          shadowColor: AppColors.neonLime.withValues(alpha: 0.45),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          textStyle: Theme.of(context).textTheme.labelLarge,
        ),
      ),
    );
  }
}
