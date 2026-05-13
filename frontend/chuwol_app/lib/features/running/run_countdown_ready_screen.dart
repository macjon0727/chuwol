import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/theme/app_colors.dart';
import '../../core/widgets/chuwol_scaffold.dart';
import '../../core/widgets/neon_card.dart';
import '../../core/widgets/neon_circle.dart';
import '../../core/widgets/primary_button.dart';
import '../../core/widgets/status_badge.dart';

class RunCountdownReadyScreen extends StatelessWidget {
  const RunCountdownReadyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChuwolScaffold(
      title: 'RUN READY',
      currentRoute: '/run-ready',
      backRoute: '/home',
      child: Column(
        children: [
          const SizedBox(height: 20),
          NeonCircle(
            size: 180,
            child: Text(
              '3',
              style: Theme.of(
                context,
              ).textTheme.displayLarge?.copyWith(color: AppColors.neonLime),
            ),
          ),
          const SizedBox(height: 28),
          const NeonCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StatusBadge(label: 'GPS READY'),
                SizedBox(height: 14),
                Text('오늘의 타겟: HYUN RUNNER'),
                SizedBox(height: 8),
                Text(
                  '남은 거리 0.43km',
                  style: TextStyle(
                    fontSize: 28,
                    color: AppColors.neonLime,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 28),
          PrimaryButton(
            label: 'GO RUN',
            icon: Icons.play_arrow_rounded,
            onPressed: () => context.go('/running'),
          ),
        ],
      ),
    );
  }
}
