import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class ScreenSection extends StatelessWidget {
  const ScreenSection({required this.title, required this.children, super.key});

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: AppColors.mutedText,
            letterSpacing: 0,
          ),
        ),
        const SizedBox(height: 10),
        ...children,
      ],
    );
  }
}
