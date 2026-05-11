import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/theme/app_colors.dart';
import '../../core/widgets/chuwol_scaffold.dart';
import '../../core/widgets/metric_tile.dart';
import '../../core/widgets/neon_card.dart';
import '../../core/widgets/secondary_button.dart';
import '../../core/widgets/status_badge.dart';

class RunningTrackingScreen extends StatelessWidget {
  const RunningTrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChuwolScaffold(
      title: 'RUNNING',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const StatusBadge(label: 'GPS LIVE'),
          const SizedBox(height: 24),
          Center(
            child: Text(
              '2.18',
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                fontSize: 76,
                color: AppColors.neonLime,
              ),
            ),
          ),
          Center(
            child: Text(
              'KM',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(color: AppColors.mutedText),
            ),
          ),
          const SizedBox(height: 24),
          const NeonCard(
            child: Text(
              '타겟까지 0.07km 남음',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
            ),
          ),
          const SizedBox(height: 16),
          const Row(
            children: [
              MetricTile(label: 'PACE', value: "5'20\""),
              SizedBox(width: 10),
              MetricTile(label: 'TIME', value: '12:04'),
            ],
          ),
          const SizedBox(height: 18),
          Row(
            children: [
              Expanded(
                child: SecondaryButton(
                  label: 'PAUSE',
                  icon: Icons.pause_rounded,
                  onPressed: () => context.go('/run-pause'),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: SecondaryButton(
                  label: 'END',
                  icon: Icons.stop_rounded,
                  danger: true,
                  onPressed: () => context.go('/run-result'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          SecondaryButton(
            label: 'LOCK',
            icon: Icons.lock_rounded,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
