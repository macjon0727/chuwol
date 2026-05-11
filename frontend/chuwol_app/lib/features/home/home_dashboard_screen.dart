import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/theme/app_colors.dart';
import '../../core/widgets/chuwol_scaffold.dart';
import '../../core/widgets/metric_tile.dart';
import '../../core/widgets/neon_card.dart';
import '../../core/widgets/primary_button.dart';
import '../../core/widgets/screen_section.dart';
import '../../core/widgets/secondary_card.dart';
import '../../core/widgets/status_badge.dart';

class HomeDashboardScreen extends StatelessWidget {
  const HomeDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChuwolScaffold(
      title: 'CHUWOL',
      currentRoute: '/home',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              MetricTile(label: 'STREAK', value: '7D'),
              SizedBox(width: 10),
              MetricTile(
                label: 'POINTS',
                value: '1,240P',
                accent: AppColors.goldTier,
              ),
            ],
          ),
          const SizedBox(height: 18),
          NeonCard(
            onTap: () => context.go('/target-detail'),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const StatusBadge(label: 'TODAY TARGET'),
                const SizedBox(height: 14),
                Text(
                  'HYUN RUNNER',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 6),
                Text(
                  '타겟이 나보다 0.42km 앞서 있음',
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge?.copyWith(color: AppColors.mutedText),
                ),
                const SizedBox(height: 18),
                Text(
                  '0.43km 이상 달리면 추월 성공',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ),
          const SizedBox(height: 22),
          ScreenSection(
            title: 'WEEKLY STREAK',
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: ['MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN']
                    .map((day) => _DayDot(day: day, active: day != 'SUN'))
                    .toList(),
              ),
            ],
          ),
          const SizedBox(height: 24),
          PrimaryButton(
            label: '오늘 러닝 시작',
            icon: Icons.directions_run_rounded,
            onPressed: () => context.go('/run-ready'),
          ),
          const SizedBox(height: 14),
          SecondaryCard(
            onTap: () => context.go('/ranking'),
            child: const Row(
              children: [
                Icon(Icons.leaderboard_rounded, color: AppColors.goldTier),
                SizedBox(width: 12),
                Expanded(child: Text('현재 Gold Tier · 42위')),
                Icon(Icons.chevron_right),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DayDot extends StatelessWidget {
  const _DayDot({required this.day, required this.active});

  final String day;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 34,
          height: 34,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: active ? AppColors.neonLime : AppColors.card,
            border: Border.all(
              color: active ? AppColors.neonLime : AppColors.border,
            ),
          ),
          child: Icon(
            Icons.check,
            size: 18,
            color: active ? AppColors.black : AppColors.mutedText,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          day,
          style: Theme.of(
            context,
          ).textTheme.labelSmall?.copyWith(color: AppColors.mutedText),
        ),
      ],
    );
  }
}
