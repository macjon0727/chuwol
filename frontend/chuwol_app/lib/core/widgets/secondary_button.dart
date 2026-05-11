import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    required this.label,
    required this.onPressed,
    this.icon,
    this.danger = false,
    super.key,
  });

  final String label;
  final VoidCallback onPressed;
  final IconData? icon;
  final bool danger;

  @override
  Widget build(BuildContext context) {
    final color = danger ? AppColors.redAlert : AppColors.whiteText;
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: OutlinedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon ?? Icons.chevron_right, size: 20),
        label: Text(label),
        style: OutlinedButton.styleFrom(
          foregroundColor: color,
          side: BorderSide(
            color: danger ? AppColors.redAlert : AppColors.border,
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          textStyle: Theme.of(context).textTheme.labelLarge,
        ),
      ),
    );
  }
}
